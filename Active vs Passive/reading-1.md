IEEE link：

[Active RIS vs. Passive RIS: Which Will Prevail in 6G? | IEEE Journals & Magazine | IEEE Xplore](https://ieeexplore.ieee.org/document/9998527)



### 1. Summary

用active RIS，环境是multi-user multiple-input single-output

贡献：

1. 构造active RIS模型，考虑放大器的热噪声（thermal noise）
2. active RIS 少elements对比多elements，再对比passive RIS
3. 构造公式（sum-rate maximization），衡量active RIS在典线通信环境的表现。
   - 通过一些操作加强表现：precoding，beamforming， fractional programming (FP)
4. 考虑实际应用，考虑active RIS自身干扰

Sections：

- Section 2：RIS的信道模型
- Section 3：分析active RIS性能，对比passive RIS
- Section 4：设计beamforming,precoding design，提出最优化表现sum-rate maximization
- Section 5：在Section 4的基础上加入RIS自身干扰，更实际
- Section 6：分析收敛性和时间复杂度
- Section 7：验证，以及验证结果
- Section 8：结论

### 2. Passive RIS and Active RIS

#### Summary

- A：回顾 Passive-RIS ，解释问题——"multiplicative fading effect"
- B：提出 Active-RIS 解决问题
- C：提出信道模型

#### Model

![MU-MISO model](image\MU-MISO model.png)

#### 接受信号表示

user-k的接受信号
$$
\begin{align*} {r_{k}}=&(\underbrace {{\mathbf{h}}_{k}^{\mathrm{ H}}}_{{\text {Direct link}}} + \underbrace {{\mathbf{f}}_{k}^{\mathrm{ H}}{ \mathbf \Psi }{\mathbf{G}}}_{{\text {Reflected link}}})\sum \limits _{j = 1}^{K} {{{\mathbf{w}}_{j}}{s_{j}}} \\&+\, \underbrace {{\mathbf{f}}_{k}^{\mathrm{ H}}{ \mathbf \Psi }{\mathbf{v}}}_{\text {Noise introduced by active RIS}} +\underbrace {z_{k}}_{\text {Noise introduced at user $k$}}, \tag{3}\end{align*}
$$

### 3. Performance Analysis

#### Summary

分析渐进（asymptotic）性能，展示Active RIS notable capacity gains

最后设置 M=1,K=1，方便分析



#### 3.A. Asymptotic SNR

SNR的渐进分析，就是求SNR，分析最优化的结果

对比Passive RIS和Active RIS在反射链上的效果

##### 条件

- 暂时无视 direct link  $h_k$ 
- 假设每个RIS element用同个放大元件，$p_n=p,n\in [1,N]$
- 信道模型用 Rayleigh-fading channels
- 由于M=1，K=1，设置 $G=g \in C^{N*1}$ ， $f_k=f \in C^{N*1}$
- $f \sim CN(0_N,\varrho_f^2I_N)$，$g \sim CN(0_N,\varrho_g^2I_N)$，$N \rightarrow \infin$

##### 公式

Passive RIS的渐进SNR
$$
\begin{equation*} \gamma _{\text {passive}} \to {N^{2}}\frac {{P_{{\text {BS}}}^{\max }{\pi ^{2}}\varrho _{f}^{2}\varrho _{g}^{2}}}{{16{\sigma ^{2}}}},\tag{4}\end{equation*}
$$
Active RIS的渐进SNR（Appendix B证明）
$$
\begin{equation*} \gamma _{\text {active}} \to N \frac {{P_{{\text {BS}}}^{\max }P_{\text {A}}^{\max }{\pi ^{2}}\varrho _{f}^{2}\varrho _{g}^{2}}}{{16\left ({{P_{\text {A}}^{\max }\sigma _{v}^{2}\varrho _{f}^{2} + P_{{\text {BS}}}^{\max }{\sigma ^{2}}\varrho _{g}^{2} + {\sigma ^{2}}\sigma _{v}^{2}} }\right)}},\tag{5}\end{equation*}
$$

- $P_{BS}^{max} \rightarrow \infin$  ：有 $\gamma _{\text {active}} \to N \frac {{P_{\text {A}}^{\max }{\pi ^{2}}\varrho _{f}^{2}}}{16\sigma^2}$ ，渐进SNR 只与 RIS-user信道的 gain $\varrho _{f}$ 和 user 处噪声功率 $\sigma^2$ 有关，换言之 BS 功率足够高 BS-RIS 信道 $g$ 和 RIS 处的噪声功率可以不考虑
- $P_{A}^{max} \rightarrow \infin$  ：有 $\gamma _{\text {active}} \to N \frac {{P_{\text {BS}}^{\max }{\pi ^{2}}\varrho _{G}^{2}}}{16\sigma_v^2}$ ，渐进SNR 只与 BS-RIS信道的 gain $\varrho _{g}$ 和RIS处噪声功率 $\sigma^2$ 有关，换言之 Active RIS 功率足够高 RIS-user 信道 $f$ 和 user 处的噪声功率可以不考虑



#### 3.B. Comparisons

##### 观察

- Passive RIS 比 Active RIS 多个系数 N
- 但是 Active RIS 的分母 比 Passive RIS 的分母要小得多，影响比 N 大
- 实际 active RIS的 SNR 优于 Passive RIS
- 只有 N 足够大的情况下，Passive RIS 才更优秀
  - 条件是论文的公式 (6) ，得出的方式就是作商比较，公式(4) / 公式(5) > 1

##### 条件

- $P_{BS-P}^{max}=2W,P_{BS-A}^{max}=P_{A}^{max}=1W$
- $\sigma^2=\sigma_v^2=-100dBm , \varrho_f^2=\varrho_g^2=-70dB$
- 对比用的$N=2.5e6$，实际很难实现如此大，大概 $N=256$ 是可以的

##### 结论

实际$N$小，Active RIS 效果是 Passive RIS 的10000倍

$N$ 足够大后会差不多，甚至 Passive RIS 反而更好



#### 3.C, Distances

考虑距离对 SNR 的影响

##### 条件

- 具体化 $\varrho_f^2=L_0d_t^{-\alpha},\varrho_g^2=L_0d_r^{-\beta}$
- $L_0$ 是每米的 path loss 系数 ，$L_0=-30dB$
- $d_t,d_r$ 是 BS-RIS 距离，RIS-user 距离
- $\alpha,\beta$ 是信道 path loss 指数，一般取值范围是 $[2,4]$
- $\sigma^2=\sigma_v^2,P_{BS-P}^{max}=P^{max},P_{BS-A}^{max}=P_{A}^{max}=\frac{P^{max}}{2}$

##### 运算

公式（8）就是公式（6）代入 $\varrho_f^2=L_0d_t^{-\alpha},\varrho_g^2=L_0d_r^{-\beta}$ ，移动个位置

注意公式（8）是Active RIS 比 Passive RIS 更好的条件，正好和公式（6）相反，符号相反

##### 推论

公式（8）右边由于 $L_0$ 很小，一般是很小的

实际各部分距离会很大，公式左边也会很大

综上，在很多实际环境下，Active RIS 的效果总比 Passive RIS 好

如果设置 $d_t=20m,L_0=-30dB,\alpha=\beta=2,P^{max}=2W,\sigma^2=-100dBm,N=1024$

根据（8），$d_r$ 超过1.43m ，Active RIS 更优，这几乎是无线通信全部范围



### 4. 设计预编码和beamform

#### Summary

- A：提出 sum-rate maximization 公式，用于展示效果
- B：设计解决以上问题的最优的 a joint transmit beamforming and reflect precoding scheme
  - 就是设计 $w$ 和 $\mathbf \Psi$



#### 4.A. Sum-Rate Maximization

用户k的SINR，就是公式（9）

由于 $E(ss^H)=I_K$ , $P_{BS},P_A$ 可以简化为公式（10），问题变成公式（11）
$$
\begin{align*}&{\mathcal{ P}}_{o}: \max \limits _{{\mathbf{w}},{ \mathbf \Psi }} R_{\mathrm{sum}}({\mathbf{w}},{ \mathbf \Psi })= \sum \limits _{k = 1}^{K} {\log _{2}\left ({{1 + {\gamma _{k}}} }\right)}, \tag{11a}\\&\qquad \quad {\mathrm{ s.t.}} {\rm C_{1}}\!:\sum \limits _{k = 1}^{K} {{{\left \|{ {{{\mathbf{w}}_{k}}} }\right \|}^{2}}} \le {P^{\max }_{\text {BS}}}, \tag{11b}\\&\hphantom {\qquad \quad {\mathrm{ s.t.}} }{\rm C_{2}}\!: \sum \limits _{k = 1}^{K}\! {{{\left \|{ { \mathbf \Psi {\mathbf{G}}{{\mathbf{w}}_{k}}} }\right \|}^{2}} + \left \|{ { \mathbf \Psi } }\right \|^{2}_{\mathrm{ F}}\sigma _{v}^{2}}\le {P^{\max }_{\text {A}}},\qquad \quad \tag{11c}\end{align*}
$$
这是个联合优化问题，但是变量太多，以及是非凸的，需要找其他办法



#### 4.B. Joint Beamforming and Precoding Scheme

##### 方式

- 引入与原问题等同的FP问题，这个问题是收敛的，引入辅助变量 $\rho,\varpi$
- 用 **Algorithm 1** 更新 $R_{sum}$ 直到收敛

![Algorithm-1](\image\Algorithm-1.png)

##### 具体过程

引入FP问题：
$$
\begin{align*}&\hspace {-.5pc}{\mathcal{ P}}_{1}: \max \limits _{{\mathbf{w}},{ \mathbf {\Psi }}, { \mathbf {\rho }},{ \mathbf \varpi }} R_{\mathrm{ sum}}'({\mathbf{w}},{ \mathbf {\Psi }},{ \mathbf \rho },{ \mathbf \varpi }) = \sum \limits _{k = 1}^{K} {\ln \left ({{1 + {\rho _{k}}} }\right)}-\,\sum \limits _{k = 1}^{K} {\rho _{k}} +\sum \limits _{k = 1}^{K} {g({\mathbf{w}},{ \mathbf {\Psi }},{\rho _{k}},{\varpi _{k}})}, \\&\qquad \quad {\mathrm{ s.t.}} {\rm C_{1}}\!: {{{\left \|{ {{{\mathbf{w}}}} }\right \|}^{2}}} \le {P^{\max }_{\text {BS}}}, \\&\hphantom {\qquad \quad {\mathrm{ s.t.}} }{\rm C_{2}}\!: \sum \limits _{k = 1}^{K} {{{\left \|{ {{{ \mathbf {\Psi }}}{\mathbf{G}}{{\mathbf{w}}_{k}}} }\right \|}^{2}} + \left \|{ {{{ \mathbf {\Psi }}}} }\right \|^{2}_{\mathrm{ F}}\sigma _{v}^{2}}\le {P^{\max }_{\text {A}}},\tag{12}\end{align*}
$$
其中
$$
\begin{align*}&g({\mathbf{w}},{ \mathbf {\Psi }},{\rho _{k}},{\varpi _{k}})= 2\sqrt {\left ({{1 + {\rho _{k}}} }\right)} {\mathop {\mathfrak R}\nolimits } \left \{{ {\varpi _{k} ^{\ast}{\bar {\mathbf h}}_{k}^{\mathrm{ H}}{{\mathbf{w}}_{k}}} }\right \} \\&\qquad -\, {\left |{ \varpi _{k} }\right |^{2}}\left ({\sum \limits _{j = 1}^{K} {{{\left |{ {{\bar {\mathbf h}}_{k}^{\mathrm{ H}}{{\mathbf{w}}_{j}}} }\right |}^{2}}} + {{\left \|{ {{{\mathbf{f}}_{k}^{\mathrm{ H}}}{{\mathbf{\Psi }}}} }\right \|}^{2}}\sigma _{v}^{2} + {\sigma ^{2}} }\right).\tag{13}\end{align*}
$$

- 更新 $\mathbf{\rho}$ ：将其他变量看成常量，最优是 $R_{sum}^{'}$ 对于 $\mathbf{\rho}$ 的导数为0，计算后有公式（14）

  - $$
    \begin{equation*} \rho ^{\mathrm{ opt}}_{k} = \frac {{\xi _{k} ^{2} + \xi _{k} \sqrt {\xi _{k} ^{2} + 4} }}{2},\quad \forall k\in \{1,\cdots,K\},\tag{14}\end{equation*}
    $$

  - 其中 $\xi _{k} = {\mathop {\mathfrak R}\nolimits }\left \{{ {\varpi _{k} ^{\ast}{\bar {\mathbf h}}_{k}^{\mathrm{ H}}{{\mathbf{w}}_{k}}} }\right \} $，R指只取实部

- 更新 $\varpi$ ：同上面的方法，计算后有公式（15）

- 更新 $\mathbf{w}$ ：用公式（16）的4个式子简化了一下数学表达，代入+去除max内部无关常量后有公式（17）

  - $$
    \begin{align*}&{\mathcal{ P}}_{2}: \max \limits _{{\mathbf{w}}} {\mathop {\mathfrak R}\nolimits } \left \{{2 {{{\mathbf{b}}^{\mathrm{ H}}}{\mathbf{w}}} }\right \} - {{\mathbf{w}}^{\mathrm{ H}}}{\mathbf{Aw}}, \\&\qquad \qquad {\mathrm{ s.t.}} {\rm C_{1}}: {{{\left \|{ {{{\mathbf{w}}}} }\right \|}^{2}}} \le {P^{\max }_{\text {BS}}}, \\&\hphantom {\qquad \qquad {\mathrm{ s.t.}} }{\rm C_{2}}: {{\mathbf{w}}^{\mathrm{ H}}}\mathbf{ {\Xi w}} \le P_{\text m}^{\max }.\tag{17}\end{align*}
    $$

  - 注意，$\mathbf{w}$ 是变量，这样一个最优化问题，用拉格朗日乘子法，可以解出公式（18）的两个 $\lambda$

  - $$
    \begin{equation*} {{\mathbf{w}}^{\mathrm{ opt}}} = {\left ({{{\mathbf{A}} + {\lambda _{1}}{{\mathbf{I}}_{MK}} + {\lambda _{2}}{\mathbf{\Xi }}} }\right)^{ - 1}}{\mathbf{b}},\tag{18}\end{equation*}
    $$

- 更新 $\mathbf{\Psi}$ ：由于变量 $\mathbf{\Psi}$ 本身是个对角矩阵，可以提到最前面，如公式（19），再加上公式（21）的一堆简化，代入${\mathcal{ P}}_{1}$，去除max内部无关常量，最终可以得出公式（20） ${\mathcal{ P}}_{3}$ 这个最优化问题

  - $$
    \begin{align*}&{\mathcal{ P}}_{3}: \max \limits _{{ \mathbf {\psi }}} {\mathop {\mathfrak R}\nolimits } \left \{{2 {{{ \mathbf {\psi }}^{\mathrm{ H}}}{ \mathbf {\upsilon }}} }\right \} - {{ \mathbf {\psi }}^{\mathrm{ H}}}{ \mathbf {\Omega \psi }}, \\&\qquad \qquad {\mathrm{ s.t.}} {\rm C_{2}}: {{ \mathbf {\psi }}^{\mathrm{ H}}}{ \mathbf {\Pi \psi }} \le P_{{\text {A}}}^{\max },\tag{20}\end{align*}
    $$

  - 同理，也是最优化问题，用拉格朗日乘子法，可以解出公式（22）的 $\mu$

  - $$
    \begin{equation*} { \mathbf {\psi }^{\mathrm{ opt}}}={\left ({{{ \mathbf {\Omega } + \mu \mathbf {\Pi }}} }\right)^{ - 1}}{ \mathbf {\upsilon }},\tag{22}\end{equation*}
    $$




### 5. 自身干扰

#### Summary

- A：建模，Active RIS 带上自身干扰（self-interference）
- B：提出优化目标 mean-squared error minimization ，去减弱自身干扰
- C：提出优化方案



#### 5.A. Self-Interference Modeling

##### 来源

由于实际阵列元件是非理想的，部分反射信号可能会再次被 Active RIS 接收，形成自干扰

##### 条件

- 套用公式（2）
- 去除可以忽略的 static noise，就是 $n_s$
- 添加自干扰

##### 公式

最终有公式（23）：
$$
\begin{equation*} {\mathbf{y}} = \underbrace {\mathbf{ {\Phi x}}}_{{\text {Desired signal}}} + \underbrace {\mathbf{ {\Phi Hy}}}_{{\text {Self-interference}}} + \underbrace {\mathbf{ {\Phi v}}}_{{\text {Dynamic noise}}},\tag{23}\end{equation*}
$$
移项后有最终自干扰公式（24），一般会有（$I_N-\Phi\mathbf{H} \neq 0$）：
$$
\begin{equation*} {\mathbf{y}} = \underbrace {{\left ({{{{\mathbf{I}}_{N}} - \mathbf{ {\Phi H}}} }\right)^{ - 1}}{\mathbf{\Phi }}}_{\text {Equivalent RIS precoding matrix}}\!\!\!\!\!\!\!\!\left ({{{\mathbf{x}} + {\mathbf{v}}} }\right).\tag{24}\end{equation*}
$$


#### 5.B. Problem Formulation

$\mathbf{\rho}$ ，$\varpi$  ，$\mathbf{w}$ 的更新方式和Section 4 的方式相同，就是把 $\mathbf{\Psi} $ 全部改为 $(I_N-\Phi\mathbf{H})^{-1}\Phi$

由于 $\mathbf{H}$ 的存在。$\Phi$ 在矩阵的逆中，不能像 公式（19）那样处理

解决方式是用一阶泰勒展开去近似

$(I_N-\Phi\mathbf{H})^{-1} \approx I_N+\Phi\mathbf{H}$ 

代入后公式（19）最终变成公式（26）
$$
\begin{align*} {\bar {\mathbf h}}_{k}^{\mathrm{H}}\approx&{\mathbf{h}}_{k}^{\mathrm{H}} + \mathbf{ f_{k}^{\mathrm{H}}}\left ({{{{\mathbf{I}}_{N}} + \mathbf{ {\Phi H}}} }\right)\mathbf{ {\Phi G}} \\\stackrel {(a)}{=}&{\mathbf{h}}_{k}^{\mathrm{H}} + \left ({{\mathbf{ f_{k}^{\mathrm{H}}} + { \mathbf \phi ^{\mathrm{H}}}{\mathrm{diag}}\left ({\mathbf{ f_{k}^{\mathrm{H}}} }\right){\mathbf{H}}} }\right)\mathbf{ {\Phi G}} \\\stackrel {(b)}{=}&{\mathbf{h}}_{k}^{\mathrm{H}} + \underbrace {\left ({{{ \mathbf \phi ^{\mathrm{H}}} + { \mathbf \phi ^{\mathrm{H}}}{{\mathbf{H}}}_{k}{\mathrm{diag}}\left ({{{ \mathbf \phi ^{\mathrm{H}}}} }\right)} }\right)}_{\text {Equivalent precoding vector for user $k$}}{\mathrm{diag}}\left ({\mathbf{ f_{k}^{\mathrm{H}}} }\right){\mathbf{G}},\tag{26}\end{align*}
$$
其中定义 $\mathbf{H}_k=diag(f_k^H)\mathbf{H}_kdiag(f_k^H)^{-1}$

对比公式（19）和公式（26），只是把 $\psi$ 换成 $\phi+diag(\phi)\mathbf{H}^H_k\phi$

最优的一种降低自干扰的方式就是让  $\phi+diag(\phi)\mathbf{H}^H_k\phi$ 尽可能接近 Section 4 算出来的理想的 $\psi^{opt} $ 

接近程度就用均方误差衡量，最小化均方误差即可，因此有公式（27）
$$
\begin{align*} {\mathcal{ P}}_{4}:\min \limits _{{ \mathbf {\phi }}} \, f\left ({{ \mathbf {\phi }} }\right)=\frac {1}{K}\sum \limits _{k = 1}^{K} {{{\left \|{ {\left ({{{ \mathbf {\phi }}} + {\mathrm{diag}}\left ({{{{ \mathbf {\phi }}}} }\right){\mathbf{H}}_{k}^{\mathrm{ H}}{{ \mathbf {\phi }}}}\right) - {{ \mathbf {\psi }}^{\mathrm{ opt}}}} }\right \|^{2}}}}, \\{}\tag{27}\end{align*}
$$

#### 5.C. Self-Interference Suppression Scheme

##### 问题

最小化 ${\mathcal{ P}}_{4}$ ，由于自干扰最优是0，最优解显然是 $\phi=\psi^{opt}$ ，但是这是很难做到的

- $H_k$ 是不确定的，不对称的，导致方程是非凸的
- $\phi$ 是指数是四次，通常无闭解
- $\phi+diag(\phi)\mathbf{H}^H_k\phi$ 不是正常四次式子，难以像公式（2）那样整理

##### 解决方式

1. 暂时固定部分变量，让 $f(\phi)$ 暂时收敛
2. 引入惩罚，这个惩罚初始很小，后面逐渐增加，让式子变得可收敛

最终有公式（28）：
$$
\begin{equation*} {\mathcal{ P}}_{5}: \min \limits _{{ \mathbf {\phi }},{ \mathbf {\phi }}'} {q}\left ({{ \mathbf {\phi }},{ \mathbf {\phi }}' }\right) = f\left ({{ \mathbf {\phi }},{ \mathbf {\phi }}' }\right) + \underbrace {\zeta {\left \|{ { \mathbf {\phi }}' - { \mathbf {\phi }} }\right \|^{2}}}_{\text {Penalty term}},\tag{28}\end{equation*}
$$
其中 $f(\phi,\phi^{'})$ 如公式（29）定义：
$$
\begin{equation*} f\left ({{ \mathbf {\phi }},{ \mathbf {\phi }}' }\right)=\frac {1}{K}\sum \limits _{k = 1}^{K} {{{\left \|{ {\left ({{{ \mathbf {\phi }}} + {\mathrm{diag}}\left ({{ \mathbf {\phi }}' }\right){\mathbf{H}}_{k}^{\mathrm{ H}}{{ \mathbf {\phi }}}}\right) - {{ \mathbf {\psi }}^{\mathrm{ opt}}}} }\right \|^{2}}}}\tag{29}\end{equation*}
$$

- $\zeta >0$ ：惩罚项，限制每次的变化，随着这个值的增加，后面越来越要满足 $\phi = \phi'$ ，因此会收敛
-  分离diag项：使得整个式子可以用求导往收敛走

分别对 $\phi ,\phi'$ 求导可知更新用的 $\phi ,\phi'$，如公式（30），公式（31）
$$
\begin{align*} {{ \mathbf {\phi }}}=&{\left ({\frac {1}{K}{\sum \limits _{k = 1}^{K} {{\mathbf{B}}_{k}^{\mathrm{ H}}{{\mathbf{B}}_{k}} + \zeta {\mathbf{I}}_{N}} } }\right)^{ - 1}}\!\left ({{\zeta {{ \mathbf {\phi }}'} + \frac {1}{K}\sum \limits _{k = 1}^{K} {{\mathbf{B}}_{k}^{\mathrm{ H}}{{ \mathbf {\psi }}^{\mathrm{ opt}}}} } }\right), \\{}\tag{30}\\ {{ \mathbf {\phi }}}'=&{\left ({\frac {1}{K}{\sum \limits _{k = 1}^{K} \!{{\mathbf{D}}_{k}^{\mathrm{ H}}{{\mathbf{D}}_{k}} \!+\! \zeta {\mathbf{I}}}_{N} } }\right)^{\!\! - 1}}\!\!\!\left ({{\zeta {{ \mathbf {\phi }}} \!+\! \frac {1}{K}\sum \limits _{k = 1}^{K}\! {{\mathbf{D}}_{k}^{\mathrm{ H}}{\left ({{ \mathbf {\psi }}^{\mathrm{ opt}}\!-\!{ \mathbf {\phi }}}\right)}} }\! }\right)\!,\!\!\!\!\! \\{}\tag{31}\end{align*}
$$
其中变量代换：$B_k=I_N+diag(\phi')H_k^H$ ，$D_k=diag(H_k^H\phi )$

计算过程是 **Algorithm 2** 

![Algorithm-2](\image\Algorithm-2.png)

##### 注意

求 $\phi$ 的过程中没有考虑 公式（11c） 中的功率限制

可以引入一个换算系数 $\tau$ ，（好的 $\phi$ 和理想的 $\psi^{opt}$ 很接近，直接乘法换算也是可以的）
$$
\begin{equation*} { \mathbf {\Phi }}^{\mathrm{ opt}} = \tau {\mathbf{\Phi }}.\tag{32}\end{equation*}
$$
换算系数可以通过把公式（10b）的 $\Psi$ 替换成 $(I_N-\Phi^{opt}H)^{-1}\Phi^{opt}$ ，求正确的 $\tau$ 使得 $P_A=P_A^{max}$

最终返回的是 $\Phi^{opt}$



### 7. 测试结果

#### Summary

- A：现实实验结果
- B：Section 4 的仿真结果
- C：Section 5 的仿真结果

#### 7.B. Section 4 Simulation

##### 模型

![Section 4 模型](\image\Section 4 模型.png)

##### 设置

- MU-MISO 系统，使用 5 GHz 频段
- 用两种信道模型
  - 强信道模型：$PL_s=37.3+22.0 \, logd$，用于 Scenario 2 的 BS-user，以及两种环境的 BS-RIS,RIS-user
  - 弱信道模型：$PL_w=41.2+28.7 \, logd$，用于 Scenario 1 的 BS-user
- 所有信道都采用瑞利信道衰落模型，有公式（37）：
  - $\begin{equation*} {\mathbf{H}} = \sqrt {\mathrm{ PL}} \left ({\sqrt {\frac {\kappa }{\kappa + 1}} {{\mathbf{H}}_{{\mathrm{LoS}}}} + \sqrt {\frac {1 }{\kappa + 1}} {{\mathbf{H}}_{{\mathrm{NLoS}}}}}\right),\tag{37}\end{equation*}$
  - 莱斯因子设置为1，即 $\kappa = 1$
- BS 在 （0,-60m），RIS在（300m，10m），users在（L，0）
- M=4，N=512，K=4，$\sigma^2=\sigma_v^2=-100dBm$ ，$P_{BS}^{max}=0.99 P^{max}$，$P_{A}^{max}=0.01 P^{max}$
- 4组情况
  - Active RIS，用 **Algorithm 1** 做precoding和beamforming
  - Passive RIS，用 [26] 的方法
  - Passive RIS，用 [40] 的方法
  - 不用 RIS



##### 仿真表现

###### Fig.8 

展示 sum-rate 与距离 L 的关系

设置：

- $P^{max}=10dBm$
- user 随机站在以（L,0）为圆心，半径为5m的圆上

![Figure8](\image\Figure8.png)



###### Fig.9 

展示 sum-rate 与最大功率 $P^{max}$ 的关系

设置：

- user 随机站在以（L,0）为圆心，半径为 50m 的圆上
- $L=300m$
- 其他和 Fig.8 相同

![Figure9](\image\Figure9.png)



###### Fig.10

展示 sum-rate 与 N 的关系

![Figure10](\image\Figure10.png)

设置：

- 变化 N ，$P^{max}=10dBm$
- 其他和 Fig.9 相同



#### 7.C Section 5 Simulation

##### 模型设置

- 与 7.B. 的 Fig.9 或者 Fig.10 相同
- $\mathbf{H}  \sim CN(0,\delta^2)$ ，$\delta$ 称为自干扰因子
- 模拟的 4 种 RIS：
  - Active RIS（理想）：没自干扰，就是 Section 4 的 Active RIS
  - Active RIS（SI suppression）：有自干扰，用 **Algorithm 1** 做 beamforming 和 precoding，用 **Algorithm 2** 压制自干扰
  - Active RIS（no suppression）：有自干扰，只用 **Algorithm 1** 做 beamforming 和 precoding
  - Passive RIS，用 [26] 的方法，没自干扰，就是 Section 4 的 Passive RIS



##### 仿真表现

展示 sum-rate 与自干扰因子 $\delta$ 的关系

![Figure11](\image\Figure11.png)



### A1. symbols' meaning

- $\mathbf{v}$ ： Active RIS自身的噪声/输入的噪声，没经过放大，建模为：$v \sim CN(0_N,\sigma_v^2I_N)$

- $M$：BS发射端天线个数

- $K$： user接收端个数

- $N$： RIS个数

- $\mathbf{s}:=[s_1,...,s_K]^T$ ：给K个user的发送信号向量，保证 $E(ss^H)=I_K$

- $G \in C^{N*M}$ ：BS-RIS信道

- $h_k^H \in C^{1*M}$ ：BS-user_k 的信道

- $f_k^H \in C^{1*N}$ ：RIS-user_k 的信道

- $w_k \in C^{M*1}$ ：beanforming向量，就是各个BS发射天线对信号 $s_k$ 的幅度、相位操作

- $z_k$ ：用户 k 处的环境高斯噪声，$CN(0,\sigma^2)$

- $\mathbf \Psi = diag(p_1e^{j\theta_1},..p_Ne^{j\theta_N}) \in C^{N*N}$ ：Active RIS变化矩阵，p是放大幅度（p>1）

- $P_{BS},P_{A},P_{BS-A}$ ：BS功率，RIS功率，Active RIS的BS功率

- $\bar{h}_k^H=h_k+f_k^H\mathbf \Psi G \in C^{1*M}$ ：BS-user 全部信道

- $\mathbf{\rho}:=[\rho_1,...,\rho_K] \in R^{K}_+$ ： FP问题引入的辅助变量

- $\mathbf{\varpi}:=[\varpi_1,...,\varpi_K] \in C^{K}$ ： FP问题引入的辅助变量

- $\xi _{k} = {\mathop {\mathfrak R}\nolimits }\left \{{ {\varpi _{k} ^{\ast}{\bar {\mathbf h}}_{k}^{\mathrm{ H}}{{\mathbf{w}}_{k}}} }\right \} $ ：公式14的额外定义，简化公式书写，这里的 $w_k^*$ 的星号应该是共轭复数

- 公式（16）的一堆定义变量：
  $$
  \begin{align*}&\hspace {-1.5pc}{\mathbf{b}}_{k}^{\mathrm{ H}} = \sqrt {\left ({{1 + {\rho _{k}}} }\right)} \varpi _{k}^{\ast}{\bar {\mathbf h}}_{k}^{\mathrm{ H}}, {\mathbf{b}} = \left [{\mathbf{ b_{1}^{\mathrm{ T}}},\mathbf{ b_{2}^{\mathrm{ T}}}, \cdots, \mathbf{ b_{N}^{\mathrm{ T}}}}\right]^{\mathrm{ T}},\tag{16a}\\&\hspace {-1.5pc}{\mathbf{A}} = {{\mathbf{I}}_{K}} \!\otimes \! \sum \limits _{k = 1}^{K} {{\left |{ {\varpi _{k}} }\right |^{2}}{{\bar {\mathbf h}}_{k}}{\bar {\mathbf h}}_{k}^{\mathrm{ H}}}, {\mathbf{\Xi }} \!=\! {{\mathbf{I}}_{K}} \otimes \left ({{{{\mathbf{G}}^{\mathrm{ H}}}{{\mathbf{\Psi }}^{\mathrm{ H}}}\mathbf{ {\Psi G}}} }\right), \qquad \tag{16b}\\&\hspace {-1.5pc}P_{\text m}^{\max } = P_{{\text {A}}}^{\max } - {\left \|{ {{{\mathbf{\Psi }}}} }\right \|^{2}_{\mathrm{ F}}}\sigma _{v}^{2}.\tag{16c}\end{align*}
  $$

- 公式（19）修改的变量

  - ${ \mathbf {\psi }}=[p_1e^{j\theta_1},..p_Ne^{j\theta_N}]$ ，对角矩阵向量表示，显然有 $diag({ \mathbf {\psi }}^H)=\mathbf{\Psi}$ 

  - $$
    \begin{equation*} {\bar {\mathbf h}}_{k}^{\mathrm{H}} = {\mathbf{h}}_{k}^{\mathrm{H}} + {{\mathbf{f}}^{\mathrm{H}}_{k}}\mathbf{ {\Psi G}} = {\mathbf{h}}_{k}^{\mathrm{H}} + {{ \mathbf {\psi }}^{\mathrm{H}}}{\mathrm{diag}}\left ({{{{\mathbf{f}}^{\mathrm{H}}_{k}}} }\right){\mathbf{G}}.\tag{19}\end{equation*}
    $$

- 公式（21）的一堆定义变量：
  $$
  \begin{align*} {{ \mathbf {\upsilon }}}=&\sum \limits _{k = 1}^{K}\sqrt {\left ({{1 + {\rho _{k}}} }\right)} {\mathrm{diag}}\left ({{\varpi _{k}^{\ast}{\mathbf{f}}_{k}^{\mathrm{ H}}} }\right){\mathbf{G}}{{\mathbf{w}}_{k}} \\&-\,\sum \limits _{k = 1}^{K}{\left |{ {\varpi _{k}} }\right |^{2}}{\mathrm{diag}}\left ({{{\mathbf{f}}_{k}^{\mathrm{ H}}} }\right){\mathbf{G}}\sum \limits _{j = 1}^{K} {{{\mathbf{w}}_{j}}{\mathbf{w}}_{j}^{\mathrm{ H}}} {{\mathbf{h}}_{k}},\tag{21a}\\ {{ \mathbf {\Omega }}}=&\sum \limits _{k = 1}^{K}{\left |{ {\varpi _{k}} }\right |^{2}}{\mathrm{diag}}\left ({{{\mathbf{f}}_{k}^{\mathrm{ H}}} }\right){\mathrm{diag}}\left ({{{{\mathbf{f}}_{k}}} }\right)\sigma _{v}^{2} \\&+\sum \limits _{k = 1}^{K}{\left |{ {\varpi _{k}} }\right |^{2}}\sum \limits _{j = 1}^{K} {{\mathrm{diag}}\left ({{{\mathbf{f}}_{k}^{\mathrm{ H}}} }\right){\mathbf{G}}{{\mathbf{w}}_{j}}{\mathbf{w}}_{j}^{\mathrm{ H}}{{\mathbf{G}}^{\mathrm{ H}}}{\mathrm{diag}}\left ({{{{\mathbf{f}}_{k}}} }\right)},\qquad \quad \tag{21b}\\ {\mathbf{\Pi }}=&\sum \limits _{k = 1}^{K} {{\mathrm{diag}}\left ({{{\mathbf{G}}{{\mathbf{w}}_{k}}} }\right){{\left ({{{\mathrm{diag}}\left ({{{\mathbf{G}}{{\mathbf{w}}_{k}}} }\right)} }\right)}^{\mathrm{ H}}}} + \sigma _{v}^{2}{{\mathbf{I}}_{N}}.\tag{21c}\end{align*}
  $$
  
- $\mathbf \Phi = diag(p_1e^{j\theta_1},..p_Ne^{j\theta_N}) \in C^{N*N}$ ：Active RIS变化矩阵，p是放大幅度（p>1），这是 Section 5用的，换个变量名方便区分
  
- ${ \mathbf {\phi }}=[p_1e^{j\theta_1},..p_Ne^{j\theta_N}]$ ，显然有 $diag({ \mathbf {\phi }}^H)=\mathbf{\Phi}$， 这是 Section 5用的，换个变量名方便区分
  
- $\psi^{opt}$ ：Section 4 计算出来的理想的 Active RIS 变化向量
  
- $\mathbf{H} \in C^{N*N}$ ：自干扰矩阵

- $\mathbf{H}_k=diag(f_k^H)\mathbf{H}_kdiag(f_k^H)^{-1}$ ：方便（26）书写，字面意思是 user-k 的自干扰矩阵

- $\zeta >0$ ：公式（28）的惩罚项，限制每次的变化

- $B_k=I_N+diag(\phi')H_k^H$ ，$D_k=diag(H_k^H\phi )$ ，公式（30）、公式（31）的变量代换

- $\tau$ ：换算系数，Section 5 最终答案需要使用，用于引入功率限制

- $\Phi^{opt}=\tau\Phi$ ：Section 5求出的最终的理想的 Active RIS 变化矩阵

- 强信道模型：$PL_s=37.3+22.0 \, logd$

- 弱信道模型：$PL_w=41.2+28.7 \, logd$

- $\mathbf{H}  \sim CN(0,\delta^2)$ ，$\delta$ 称为自干扰因子，7.C 模型设置



### A2. abbreviation

- MU-MISO：multi-user multiple-input single-output
- RF：radio-frequency 射频
- FD-AF： full-duplex amplify-and-forward 全双工放大转发