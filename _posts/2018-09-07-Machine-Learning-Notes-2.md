---
layout:     post
title:      Machine Learning Notes (2)
subtitle:   Chapter II - Linear Regression
date:       2018-09-07
author:     Arsennnic
header-img: img/posts/2018-08-28-Machine-Learning-Notes-2/header_bg.png
catalog: true
mathjax: true
tags:
    - Machine-Learning
    - Matlab
---



## 1 Supervised / Unsupervised Learning

### 1.1 Supervised Learning

Supervised learning problems are categorized into **"regression"** and **"classification"** problems. 

In a **regression** problem, we are trying to predict results within a continuous output, meaning that we are trying to map input variables to some **continuous** function. 

In a **classification** problem, we are instead trying to predict results in a discrete output. In other words, we are trying to map input variables into **discrete** categories.

### 1.2 Unsupervised Learning

Unsupervised learning allows us to approach problems **with little or no idea what our results should look like**. We can derive structure from data where we don't necessarily know the effect of the variables.

We can derive this structure by clustering the data based on relationships among the variables in the data.

With unsupervised learning there is no feedback based on the prediction results.





## 2 Cost Function

For **supervised learning**: given a trainning set, learn a function $h_\theta(x)$ to predict the magnitude of $y$. If $h_\theta(x) \rightarrow y$, we can say $h_\theta(x)$ is a good predictor for the corresponding value of $x$. Where,

$$
h_\theta(x) = \theta^T x
$$


![Model Representation](../../../../img/posts/2018-08-28-Machine-Learning-Notes-1/model_representation.png)


We can measure the accuracy of our hypothesis function by using a **cost function**：


$$
J(\theta) = \frac{1}{2m}\sum_{i=1}^m (h_\theta(x^{(i)})-y^{(i)})^2
= \frac{1}{2m}\sum_{i=1}^m (\theta^Tx^{(i)}-y^{(i)})^2
$$


Find the $\theta$ vector which can minimize $J(\theta)$ will be our task.








## 3 Gradient Descent

### 3.1 Defination
The gradient descent algorithm is commonly used for minimizing $J(\theta)$:


$
\begin{split}
& \textit{Repeat until convergency: } \\{ \\\\ 
& \quad\quad \theta_j := \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\theta) \\\\ 
& \\}
\end{split}
$


Where $\alpha$ is called learning rate. **If $\alpha$ is too large, cost function may not converge;** while **if $\alpha$ is too small, it will take a rather long time for cost function to converge.**


Mostly, $J(\theta)$ is discrete-valued and non-differentiable, so we compute in this way:


$
\begin{split}
& \textit{Repeat until convergency: } \\{ \\\\ 
& \quad\quad \theta_j := \theta_j - \alpha\frac{1}{m}\sum_{i=1}^m (h_\theta(x^{(i)})-y^{(i)}) \cdot x_j^{(i)} \\\\ 
& \\}
\end{split}
$

A vectorized implementation is:

$$
\theta := \theta - \frac{\alpha}{m} X^T (X\theta - Y)
$$

where, $\theta$ is a n-by-1 vector, $X$ is a m-by-n matrix and $Y$ is a m-by-1 vector.


![Gradient Descent Result](../../../../img/posts/2018-08-28-Machine-Learning-Notes-1/gradient_descent_result.png)


A **convex** cost function can always converges (with a not too large $\alpha$) to the **global minimum** with gradient descent method, but a non-convex function may converge to a local minimum.




### 3.2 Feature Scaling / Mean Normalization

**We can speed up gradient descent by having input values in roughly the same range.**
 This is because $\theta$ will descend quickly on small ranges but slowly on large ranges, and so will oscillate inefficiently down to the optimum when the variables are very uneven.

Ideally:

$$
-1 \le x_j^{(i)} \le 1
$$

or 

$$
-0.5 \le x_j^{(i)} \le 0.5
$$

These aren't exact requirements; we are only trying to speed things up. 


Two techniques to help with this are **feature scaling** and **mean normalization**.

$$
x_j^{(i)} := \frac{x_j^{(i)} - \mu^{(i)}}{s^{(i)}}
$$

where, $\mu^{(i)}$ is the average of all values for feature $x^{(i)}$. For $s^{(i)}$:

- If $s^{(i)}$ is chosen as the **range** of $x^{(i)}$, 
$s^{(i)} = \max(x^{(i)}) - \min(x^{(i)})$, 
the method will be called **"feature scaling"**

- If $s^{(i)}$ is chosen as the **standard deviation** of $x^{(i)}$, 
the method will be called **"mean normalization"**







## 4 Normal Equation

### 4.1 Defination

Gradient descent gives one way of minimizing cost function $J(\theta)$, and normal equation gives another.

$$
\theta = (X^TX)^{-1}X^Ty
$$

*Persona Understanding:*

$$
\theta = \frac{y}{X} = \frac{X^Ty}{X^TX} = (X^TX)^{-1}X^Ty
$$


In this way, we can directly find the vector $\theta$ which can minimize cost function $J(\theta)$. 
But with the normal equation, computing the inversion has complexity $O(n^3)$, so if we have a very large number of features, the normal equation will be slow. 


### 4.2 Comparison


&emsp; | Gradient Descent | Normal Equation
:-: | :-: | :-:
Choose learning rate $\alpha$ | True | False 
Iterative calculation | True | False
Calculation complexity | $O(kn^2)$ | $O(n^3)$ 
Work well when $n$ is large |True | False


### 4.3 Noninvertibility

Sometimes $X^TX$ is **not invertable**, the common causes might be:

- Redundant features, where two features are very closely related (i.e. they are linearly dependent)

- Too many features (e.g. $m \le n$). In this case, delete some features or use 
**"[regularization](../../../../2018/09/07/Machine-Learning-Notes-2/#2-regularization)"**.

Solutions to the above problems include deleting a feature that is linearly dependent with another or deleting one or more features when there are too many features.