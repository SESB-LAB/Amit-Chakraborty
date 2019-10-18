INTRODUCTION

This MATLAB program describes the model for bistable response of protein NRT1.1 along the increasing nitrate gradient. 

It is based on three differential equations:

The first equation, based on Hill equation, describes the response of protein, NRT1.1, to the variable input nitrate.

The second equation, describes the Michaelis-Menten type kinetics of NRT1.1 interactions with the Kinase, CIPK23 and Calcium Binding Protein, CBL9.

The third equation describes the dynamics of phosphorylated NRT1.1, which we call NRT1.1P. It is based on the responses comming NRT1.1 and the CBL9.CIPK23 complex. These responses forming a gate function and are integrated by this particular equation [1]. 

INPUT:

The input to the model is nitrate concentration (NI) ranging from 0.1 mM to 25 mM. These values are taken from Ho et al. (2009) [2]
OUTPUT:

The output of the model shows bistable behaviour of the phosphorylated protein NRT1.1P along the increasing nitrtae gradient. 

The model shows that as long as the nitrate concentration reaches 1mM, NRT1.1 will be phosphorylated and all these states will be stable. As the nitrate concentration crosses 1mM threshold, NRT1.1 will not be phosphorylated and all the non-phosphorylaetd states will also be stable. The local stability of these states is confirmed using local Lyapunov exponent method. 

Thus the model shows the SWITCH LIKE RESPONSE of NRT1.1 in the face of wide range of nitrate concentrations.


REFERENCES:

1. Rashid, M. et al. (2019) Feedforward control of plant nitrate transporter NRT1.1 biphasic adaptive activity. Biophysical Journal.... 
2. Ho, C.H., S.H. Lin, H.C. Hu, Y.F. Tsay (2009). CHL1 functions as a nitrate sensor in plants. Cell 138:1184–1194.

    
