//+------------------------------------------------------------------+
//|                                                MA_Triple_Alert.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots   3

//--- plot MA5
#property indicator_label1  "MA5"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//--- plot MA8
#property indicator_label2  "MA8"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrBlue
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

//--- plot MA13
#property indicator_label3  "MA13"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrGreen
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

//--- input parameters
input int                InpMA5Period = 5;        // MA5 Period
input int                InpMA8Period = 8;        // MA8 Period
input int                InpMA13Period = 13;      // MA13 Period
input ENUM_MA_METHOD     InpMAMethod = MODE_SMA;  // MA Method
input ENUM_APPLIED_PRICE InpAppliedPrice = PRICE_CLOSE; // Applied Price
input double             InpMinDistance = 5.0;    // Minimum distance between MAs (points)
input bool               InpEnableAlerts = true;  // Enable Alerts
input bool               InpEnableSounds = true;  // Enable Sound Alerts
input string             InpBuySound = "alert.wav"; // Buy Alert Sound
input string             InpSellSound = "alert2.wav"; // Sell Alert Sound

//--- indicator buffers
double         MA5Buffer[];
double         MA8Buffer[];
double         MA13Buffer[];

//--- global variables
int            ma5_handle, ma8_handle, ma13_handle;
datetime       last_alert_time = 0;
bool           last_buy_signal = false;
bool           last_sell_signal = false;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
   //--- indicator buffers mapping
   SetIndexBuffer(0, MA5Buffer, INDICATOR_DATA);
   SetIndexBuffer(1, MA8Buffer, INDICATOR_DATA);
   SetIndexBuffer(2, MA13Buffer, INDICATOR_DATA);
   
   //--- set index labels
   PlotIndexSetString(0, PLOT_LABEL, "MA(" + IntegerToString(InpMA5Period) + ")");
   PlotIndexSetString(1, PLOT_LABEL, "MA(" + IntegerToString(InpMA8Period) + ")");
   PlotIndexSetString(2, PLOT_LABEL, "MA(" + IntegerToString(InpMA13Period) + ")");
   
   //--- create MA handles
   ma5_handle = iMA(_Symbol, _Period, InpMA5Period, 0, InpMAMethod, InpAppliedPrice);
   ma8_handle = iMA(_Symbol, _Period, InpMA8Period, 0, InpMAMethod, InpAppliedPrice);
   ma13_handle = iMA(_Symbol, _Period, InpMA13Period, 0, InpMAMethod, InpAppliedPrice);
   
   //--- check handles
   if(ma5_handle == INVALID_HANDLE || ma8_handle == INVALID_HANDLE || ma13_handle == INVALID_HANDLE)
   {
      Print("Error creating MA handles");
      return(INIT_FAILED);
   }
   
   //--- set indicator short name
   IndicatorSetString(INDICATOR_SHORTNAME, "MA Triple Alert (5,8,13)");
   
   //--- set digits
   IndicatorSetInteger(INDICATOR_DIGITS, _Digits);
   
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   //--- release handles
   if(ma5_handle != INVALID_HANDLE)
      IndicatorRelease(ma5_handle);
   if(ma8_handle != INVALID_HANDLE)
      IndicatorRelease(ma8_handle);
   if(ma13_handle != INVALID_HANDLE)
      IndicatorRelease(ma13_handle);
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   //--- check for minimum bars
   if(rates_total < InpMA13Period)
      return(0);
   
   //--- calculate start position
   int start = prev_calculated;
   if(start == 0)
      start = InpMA13Period;
   
   //--- copy MA values
   if(CopyBuffer(ma5_handle, 0, 0, rates_total, MA5Buffer) <= 0)
      return(0);
   if(CopyBuffer(ma8_handle, 0, 0, rates_total, MA8Buffer) <= 0)
      return(0);
   if(CopyBuffer(ma13_handle, 0, 0, rates_total, MA13Buffer) <= 0)
      return(0);
   
   //--- check for alerts on the latest completed bar
   if(InpEnableAlerts && rates_total > prev_calculated)
   {
      CheckForAlerts(rates_total - 2, time); // Check previous bar (completed)
   }
   
   return(rates_total);
}

//+------------------------------------------------------------------+
//| Check for buy/sell alert conditions                             |
//+------------------------------------------------------------------+
void CheckForAlerts(int index, const datetime &time[])
{
   if(index < 3) return; // Need at least 3 bars for trend analysis
   
   //--- avoid multiple alerts on the same bar
   if(time[index] <= last_alert_time)
      return;
   
   //--- get current and previous MA values
   double ma5_curr = MA5Buffer[index];
   double ma8_curr = MA8Buffer[index];
   double ma13_curr = MA13Buffer[index];
   
   double ma5_prev = MA5Buffer[index-1];
   double ma8_prev = MA8Buffer[index-1];
   double ma13_prev = MA13Buffer[index-1];
   
   double ma5_prev2 = MA5Buffer[index-2];
   double ma8_prev2 = MA8Buffer[index-2];
   double ma13_prev2 = MA13Buffer[index-2];
   
   //--- convert minimum distance to price units
   double min_distance = InpMinDistance * _Point;
   
   //--- check buy conditions
   bool buy_condition = CheckBuyCondition(ma5_curr, ma8_curr, ma13_curr, 
                                         ma5_prev, ma8_prev, ma13_prev,
                                         ma5_prev2, ma8_prev2, ma13_prev2,
                                         min_distance);
   
   //--- check sell conditions  
   bool sell_condition = CheckSellCondition(ma5_curr, ma8_curr, ma13_curr,
                                           ma5_prev, ma8_prev, ma13_prev,
                                           ma5_prev2, ma8_prev2, ma13_prev2,
                                           min_distance);
   
   //--- generate alerts
   if(buy_condition && !last_buy_signal)
   {
      GenerateAlert("BUY", "MA Triple Buy Signal - All MAs trending up and separated", InpBuySound);
      last_alert_time = time[index];
      last_buy_signal = true;
      last_sell_signal = false;
   }
   else if(sell_condition && !last_sell_signal)
   {
      GenerateAlert("SELL", "MA Triple Sell Signal - All MAs trending down and separated", InpSellSound);
      last_alert_time = time[index];
      last_sell_signal = true;
      last_buy_signal = false;
   }
   else if(!buy_condition && !sell_condition)
   {
      last_buy_signal = false;
      last_sell_signal = false;
   }
}

//+------------------------------------------------------------------+
//| Check buy condition                                              |
//+------------------------------------------------------------------+
bool CheckBuyCondition(double ma5_curr, double ma8_curr, double ma13_curr,
                      double ma5_prev, double ma8_prev, double ma13_prev,
                      double ma5_prev2, double ma8_prev2, double ma13_prev2,
                      double min_distance)
{
   //--- check if all MAs are trending up (current > previous > previous2)
   bool ma5_up = (ma5_curr > ma5_prev) && (ma5_prev > ma5_prev2);
   bool ma8_up = (ma8_curr > ma8_prev) && (ma8_prev > ma8_prev2);
   bool ma13_up = (ma13_curr > ma13_prev) && (ma13_prev > ma13_prev2);
   
   //--- check if MAs are properly ordered (MA5 > MA8 > MA13)
   bool proper_order = (ma5_curr > ma8_curr) && (ma8_curr > ma13_curr);
   
   //--- check if MAs are not touching (minimum distance between them)
   bool not_touching = (ma5_curr - ma8_curr >= min_distance) && 
                      (ma8_curr - ma13_curr >= min_distance);
   
   return (ma5_up && ma8_up && ma13_up && proper_order && not_touching);
}

//+------------------------------------------------------------------+
//| Check sell condition                                             |
//+------------------------------------------------------------------+
bool CheckSellCondition(double ma5_curr, double ma8_curr, double ma13_curr,
                       double ma5_prev, double ma8_prev, double ma13_prev,
                       double ma5_prev2, double ma8_prev2, double ma13_prev2,
                       double min_distance)
{
   //--- check if all MAs are trending down (current < previous < previous2)
   bool ma5_down = (ma5_curr < ma5_prev) && (ma5_prev < ma5_prev2);
   bool ma8_down = (ma8_curr < ma8_prev) && (ma8_prev < ma8_prev2);
   bool ma13_down = (ma13_curr < ma13_prev) && (ma13_prev < ma13_prev2);
   
   //--- check if MAs are properly ordered (MA5 < MA8 < MA13)
   bool proper_order = (ma5_curr < ma8_curr) && (ma8_curr < ma13_curr);
   
   //--- check if MAs are not touching (minimum distance between them)
   bool not_touching = (ma8_curr - ma5_curr >= min_distance) && 
                      (ma13_curr - ma8_curr >= min_distance);
   
   return (ma5_down && ma8_down && ma13_down && proper_order && not_touching);
}

//+------------------------------------------------------------------+
//| Generate alert                                                   |
//+------------------------------------------------------------------+
void GenerateAlert(string signal_type, string message, string sound_file)
{
   string alert_message = _Symbol + " " + EnumToString(_Period) + " - " + message;
   
   //--- print to log
   Print(alert_message);
   
   //--- show alert dialog
   Alert(alert_message);
   
   //--- play sound
   if(InpEnableSounds)
   {
      PlaySound(sound_file);
   }
   
   //--- send notification (if enabled in terminal)
   SendNotification(alert_message);
} 