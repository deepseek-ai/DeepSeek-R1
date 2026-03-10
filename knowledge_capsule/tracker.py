from enum import Enum
class P(Enum): S="sprout"; G="green_leaf"; Y="yellow_leaf"; R="red_leaf"; SO="soil"
class Capsule:
    def __init__(self,i,c,p="P2"): self.i=i; self.c=c; self.p=p; self.conf=0.7; self.ph=P.S
    def boost(self): self.conf=min(1.0,self.conf+0.03); self.ph=P.G if self.conf>=0.8 else P.S
