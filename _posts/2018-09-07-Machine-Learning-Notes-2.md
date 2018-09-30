---
layout:     post
title:      Machine Learning Notes (2)
subtitle:   Chapter II - Logistic Regression & Regularization
date:       2018-09-07
header-img: img/posts/Machine Learning Notes (2)/header_bg.png
catalog: true
mathjax: true
tags:
    - Machine-Learning
    - Matlab
---



## 1 Logistic Regression

### 1.1 Hypothesis Representation

In linear regression,

$$
h_\theta(x) = \theta^Tx
$$

We could approach the classification problem ignoring the fact that $y$ is discrete-valued, and use our old linear regression algorithm to try to predict $y$ given $x$. However, it is easy to construct examples where this method performs very poorly. Besides, it also doesn’t make sense for $h_\theta(x)$ to take values larger than 1 or smaller than 0 when we know that $y \in \\{0, 1\\}$.

To fix this problem, we hope our hypotheses function $h_\theta(x)$ satisfies $0 \le h_\theta(x) \le 1$.

Here we introduces **Logistic / Sigmold function**: 

$$
z = \theta^Tx
$$

$$
g(z) = \frac{1}{1+e^{-z}}
$$

The following image shows us what the sigmoid function looks like:

![Sigmold function]({{site.url}}/img/posts/{{page.title}}/sigmold_function.png)

The function $g(z)$ shown here, maps any real number to the (0, 1) interval, making it useful for transforming an arbitrary-valued function into a function better suited for classification.

So we change the form of hypotheses function $h_\theta(x)$ in this way:

$$
h_\theta(x) = g(\theta^Tx) = \frac{1}{1+e^{-\theta^Tx}}
$$

$h_\theta(x)$ will give us the probability that our output is 1. For example, $h_\theta(x)=0.7$  gives us a probability of 70% that our output is 1. The probability that our prediction is 0 is just the complement of our probability that it is 1 (e.g. if probability that it is 1 is 70%, then the probability that it is 0 is 30%).

$$
h_\theta(x) = P(y=1|x;\theta) = 1 - P(y=0|x;\theta)
$$

Obviously, 

$$
P(y=1|x;\theta) + P(y=0|x;\theta) = 1
$$


### 1.2 Decision Boundary

In order to get our discrete classification ( $y \in \\{0, 1\\}$ ), we can translate the output of the hypothesis function as follows:

$$
h_\theta (x) \ge 0.5 \rightarrow y=1
$$


$$
h_\theta (x) < 0.5 \rightarrow y=0
$$

### 1.3 Cost Function

We cannot use the same cost function that we use for linear regression because the Logistic Function will cause the output to be wavy, causing many local optima. In other words, it will not be a convex function.

Instead, the cost function for logistic regression is:

$$
J(\theta) = \frac{1}{m}\sum_{i=1}^m cost(h_\theta(x^{(i)}), y^{(i)})
$$

where, if $y=1$:

$$
cost(h_\theta(x^{(i)}), y^{(i)}) = -\ln(h_\theta(x^{(i)})
$$

else if $y=0$:

$$
cost(h_\theta(x^{(i)}), y^{(i)}) = -\ln(1 - h_\theta(x^{(i)})
$$


The figure looks like:

![Cost Function]({{site.url}}/img/posts/{{page.title}}/cost_function.png)


We can compress our cost function's two conditional cases into one case:

$$
cost(h_\theta(x), y) = 
-y\ln(h_\theta(x)) - (1-y)\ln(1-h_\theta(x))
$$


### 1.4 Gradient Descent

The general form of gradient descent is:


$
\begin{split}
& \textit{Repeat until convergency: } \\{ \\\\ 
& \quad\quad \theta_j := \theta_j - \alpha\frac{\partial}{\partial\theta_j}J(\theta) \\\\ 
& \\}
\end{split}
$


We can work out the derivative part using calculus to get:

$
\begin{split}
& \textit{Repeat until convergency: } \\{ \\\\ 
& \quad\quad \theta_j := \theta_j - \alpha\frac{1}{m}\sum_{i=1}^m (h_\theta(x^{(i)})-y^{(i)}) \cdot x_j^{(i)} \\\\ 
& \\}
\end{split}
$


**Notice**: this algorithm is identical to the one we used in linear regression. We still have to simultaneously update all values in theta.

A vectorized implementation is:

$$
\theta := \theta - \frac{\alpha}{m} X^T (g(X\theta) - Y)
$$

where, $\theta$ is a n-by-1 vector, $X$ is a m-by-n matrix and $Y$ is a m-by-1 vector.


### 1.5 Multiclass Classification

Now we will approach the classification of data when we have more than two categories. Instead of $y \in \\{0,1\\}$, we will expand our definition so that $y \in \\{0,1,2,...,n\\}$.

We divide the problem into (n+1) binary classification, in each one we predict the probability.

$$
h_\theta^{(i)} = P(y=i|x;\theta), \quad i\in\{0,1,2...,n\}
$$

And we pick the class with the highest probability -- $\max(h_\theta^{(i)})$ -- as our prediction.

The general principle of multiclass classification is so-called **ONE-vs-ALL**.






## 2 Regularization

### 2.1 Overfitting

Consider the problem of predicting $y$ from $x \in \mathbb{R}$. 

Figure (a) shows original data. Figure (b)(c)(d) show the results of fitting a first-order, second-order and high-order polynomial function to the dataset. 

![Overfitting]({{site.url}}/img/posts/{{page.title}}/overfitting.png)

As showed in figure (b), the data doesn’t really lie on straight line, and so the fit is not very good. We say figure (b) shows an instance of **underfitting**.

As showed in figure (d), even though the fitted curve passes through all of the trainning data perfectly, we would not expect this to be a very good predictor for new data. We say figure (d) shows an instance of **overfitting**.

Underfitting, or high bias, is when the form of our hypothesis function $h_\theta (x)$ maps poorly to the trend of the data. It is usually caused by a function that is too simple or uses too few features. At the other extreme, overfitting, or high variance, is caused by a hypothesis function that fits the available data but does not generalize well to predict new data. It is usually caused by a complicated function that creates a lot of unnecessary curves and angles unrelated to the data.

This terminology is applied to both linear and logistic regression. There are two main options to address the issue of overfitting:

- Reduce the number of features:
	- Manually select which features to keep
	- Use a model selection algorithm (studied later in the course)

- **Regularization**: 
	- Keep all the features, but reduce the magnitude of parameters $\theta_j$

Regularization works well when we have a lot of slightly useful features.


### 2.2 Regularized Cost Function For Linear Regression

If we have overfitting from our hypothesis function, we can reduce the weight that some of the terms in our function carry by increasing their cost.

For example, if we want to make a high-order polynomial fitting function, as showed in figure (d), be closer to a quadratic function:

$$
h_\theta (x) = \theta_0 + \theta_1 x + \theta_2 x^2 + \theta_3 x^3 +\theta_4 x^4 
\quad \rightarrow \quad
\theta_0 + \theta_1 x + \theta_2 x^2
$$

Without actually getting rid of these features or changing the form of our hypothesis, we can instead modify our **cost function**:

$$
J(\theta) = \frac{1}{2m}\sum_{i=1}^m (h_\theta(x^{(i)}) - y^{(i)})^2 + 1000\cdot\theta_3^2 + 1000\cdot\theta_4^2
\quad \rightarrow \quad
\theta_3 \approx \theta_4 \approx 0
$$

In this way, $\theta_3$ and $\theta_4$ must be rather small so our cost function can be minimized by gradient descent. When $\theta_3$ and $\theta_4$ approach 0, we actually eliminate the influence of $\theta_3x^3$ and $\theta_4x^4$.


Normally, we can regularize all of our theta parameters in a single summation as:

$$
J(\theta) = \frac{1}{2m}\sum_{i=1}^m (h_\theta(x^{(i)}) - y^{(i)})^2 + \lambda \sum_{j=1}^n \theta_j^2
$$

The $\lambda$ is the **regularized parameter**. It determines how much the costs of our theta parameters are inflated.

Using the above cost function with the extra summation, we can smooth the output of our hypothesis function to reduce overfitting. If $\lambda$ is chosen to be too large, it may smooth out the function too much and cause underfitting.


### 2.3 Regularized Gradient Descent / Normal Equation

#### 2.3.1 Gradient Descent

We will modify our gradient descent function to separate out $\theta_0$ from the rest of the parameters because we do not want to penalize $\theta_0$:

$
\begin{split}
& \textit{Repeat until convergency: } \\{ \\\\ 
& \quad\quad \theta_0 := \theta_0 - \alpha\frac{1}{m}\sum_{i=1}^m (h_\theta(x^{(i)})-y^{(i)}) \cdot x_0^{(i)} \\\\ 
& \quad\quad \theta_j := \theta_j - \alpha \Big[ \frac{1}{m}\sum_{i=1}^m (h_\theta(x^{(i)})-y^{(i)}) \cdot x_j^{(i)} + \frac{\lambda}{m}\theta_j \Big], \quad j \in \{1,2,...,n\} \\\\ 
& \\}
\end{split}
$

The term $\frac{\lambda}{m}\theta_j$ performs our regularization. Our update rule can also be represented as:

$$
\theta_j := \theta_j (1-\alpha\frac{\lambda}{m}) - \alpha \frac{1}{m} \sum_{i=1}^m (h_\theta (x^{(i)}) - y^{(i)})x_j^{(i)}, \quad j \in \\{1,2,...,n\\}
$$

The first term in the above equation, $1 - \alpha\frac{\lambda}{m}$, will always be less than 1. Intuitively we can see it as reducing the value of $\theta_j$ by some amount on every update. Notice that **the second term is now exactly the same as it was before**.

#### 2.3.2 Normal Equation

To add in regularization, the equation is the same as our original, except that we add another term inside the parentheses:

$$
\theta = (X^TX + \lambda \cdot L)^{-1}X^Ty
$$

where, 

$$
L=\left[
\begin{matrix}
0 &   &   &   &   \\ 
  & 1 &   &   &   \\ 
  &   & 1 &   &   \\ 
  &   &   & \ddots & \\ 
  &   &   &  & 1
\end{matrix}
\right]
$$

Intuitively, $L$ is the identity matrix (because we are not including $\theta_0$), multiplied with a single real number $\lambda$.

Recall that if $m < n$, then $X^TX$ is non-invertible. However, when we add the term $\lambda\cdot L$, then ($X^T X + \lambda\cdot L$) becomes invertible.


### 2.4 Regularization For Logistic Regression

We can regularize logistic regression in a similar way that we regularize linear regression. As a result, we can avoid overfitting. 

Recall that cost function for logistic regression was:

$$
J(\theta) = -\frac{1}{m} \sum_{i=1}^m
\Big[ y^{(i)}\ln(h_\theta(x^{(i)})) + (1-y^{(i)})\ln(1-h_\theta(x^{(i)})) \Big]
$$

We can regularize this equation by adding a term to the end:

$$
J(\theta) = -\frac{1}{m} \sum_{i=1}^m
\Big[ y^{(i)}\ln(h_\theta(x^{(i)})) + (1-y^{(i)})\ln(1-h_\theta(x^{(i)})) \Big]+\frac{\lambda}{2m} \sum_{j=1}^n \theta_j^2
$$

The second sum, $\sum_{j=1}^n \theta_j^2$ means to explicitly exclude the bias term $\theta_0$. 
**Notice: the $\theta$ vector is indexed from 0 to n, and this sum explicitly skip $\theta_0$.**

