This simulation code package is mainly used to reproduce the results of the following paper [1]:

[1] Z. Zhang, L. Dai, X. Chen, C. Liu, F. Yang, R. Schober, and H. V. Poor, "Active RIS vs. passive RIS: Which will prevail in 6G?," IEEE Trans. Commun., vol. 71, no. 3, pp. 1707-1725, Mar. 2023.

The conference version of this journal paper is:

[2] Z. Zhang, L. Dai, X. Chen, C. Liu, F. Yang, R. Schober, and H. V. Poor, "Active RISs: Signal modeling, asymptotic analysis, and beamforming design," in Proc. 2022 IEEE Global Communications Conference (IEEE GLOBECOM'22), Rio de Janeiro, Brazil, Dec. 2022.
*********************************************************************************************************************************
If you use this simulation code package in any way, please cite the original paper [1] above. 

The author in charge of this simulation code pacakge is: Zijian Zhang (email: zhangzj20@mails.tsinghua.edu.cn).

Reference: We highly respect reproducible research, so we try to provide the simulation codes for our published papers (more information can be found at: 
http://oa.ee.tsinghua.edu.cn/dailinglong/publications/publications.html). 

Please note that the MATLAB R2021a and CVX 3.1 are used for this simulation code package,  and there may be some imcompatibility problems among different software versions. 

Copyright reserved by the Broadband Communications and Signal Processing Laboratory (led by Dr. Linglong Dai), Tsinghua National Laboratory
for Information Science and Technology (TNList), Department of Electronic Engineering, Tsinghua University, Beijing 100084, China. 

*********************************************************************************************************************************
Abstract of the paper: 

As a revolutionary paradigm for controlling wireless channels, reconfigurable intelligent surfaces (RISs) have emerged as a candidate technology for future 6G networks. However,
due to the ¡°multiplicative fading¡± effect, the existing passive RISs only achieve limited capacity gains in many scenarios with strong direct links. In this paper, the concept of active RISs is proposed to overcome this fundamental limitation. Unlike passive RISs that reflect signals without amplification, active RISs can amplify the reflected signals via amplifiers integrated into their elements. To characterize the signal amplification and incorporate the noise introduced by the active components, we develop and verify the signal model of active RISs through the experimental measurements based on a fabricated active RIS element. Based on the verified signal model, we further analyze the asymptotic performance of active RISs to reveal the substantial capacity gain they provide for wireless communications. Finally, we formulate the sum-rate maximization problem for an active RIS aided multi-user multiple-input single-output (MU-MISO) system and a joint transmit beamforming and reflect precoding scheme is proposed to solve this problem. Simulation results show that, in a typical wireless system, passive RISs can realize only a limited sum-rate gain of 22%, while active RISs can achieve a significant sum-rate gain of 130%, thus overcoming the ¡°multiplicative fading¡± effect.

*********************************************************************************************************************************
How to use this simulation code package?

1. Run "main.m" and "main_1_2.m" to obtain the results in Fig. 8.

2. Run "main_2.m" and "main_2_2.m" to obtain the results in Fig. 9.

3. Run "main_3.m" and "main_3_2.m" to obtain the results in Fig. 10.

4. Run "main_4.m" and "main_4_2.m" to obtain the results in Fig. 11.

*********************************************************************************************************************************
Enjoy the reproducible research!






