---
layout:     post
title:      Machine Learning Notes (3)
subtitle:   Chapter III - Neural Networks Representation
date:       2018-09-30
header-img: img/posts/Machine Learning Notes (3)/header_bg.png
catalog: true
mathjax: true
tags:
    - Machine-Learning
    - Matlab
---



## 1 Motivations

Consider a supervised learning classification problem. 
You may apply logistic regression with a lot of nonlinear features like $x_1$, $x_2$, $x_1^2$, $x_2^2$, $x_1x_2$, $x_1^2x_2$, $x_1x_2^2$, $\cdots$ and so on. If you include enough polynomial terms then you can train a precise hypotheses model. However, most problems have more than just two features, $x_1$ and $x_2$, but over one thousand or even one million features. It will be too computationally expensive to train a hypotheses model with non-linear method for these problems.

![Neural]({{site.url}}/img/posts/{{page.title}}/neutral_biology.png)	


The origins of Neural Networks was as algorithms that try to mimic the brain and those a sense that if we want to build learning systems while why not mimic perhaps the most amazing learning machine we know about, which is perhaps the brain. Modern Neural Networks today are the state of the art technique for many applications. 




## 2 Model Representation

At a very simple level, neurons are basically computational units that take inputs (**dendrites**) as electrical inputs that are channeled to outputs (**axons**). 
In our model, our dendrites are like the input features $x_1$, $x_2$, $\cdots$, $x_n$ and the axons are the result of our hypothesis function. 

![Neural Network]({{site.url}}/img/posts/{{page.title}}/neutral_network_representation.png)

In this model our $x_0$ input node is sometimes called the "**bias unit**". It is always equal to 1. In neural networks, we use the same logistic function as in classification, 

$$
h_\theta (x) = \frac{1}{1 + e^{-\theta^Tx}}
$$

yet we sometimes call it a sigmoid (logistic) activation function. $\theta$ parameters are sometimes called "weights".

Visually, a simplistic representation looks like:

$$
\left[
\begin{matrix}
x_0 \\
x_1 \\
x_2 \\
\vdots
\end{matrix}
\right]
\rightarrow
\Big[\quad\Big]
\rightarrow
h_\theta(x)
$$

Our input nodes (layer 1), also known as the "**input layer**", go into another node (layer 2), which finally outputs the hypothesis function, known as the "**output layer**". And intermediate layers of nodes between the input and output layers are called the "**hidden layers**".

We label these intermediate or "hidden" layer nodes $a_1^{(2)}$, $a_2^{(2)}$, $\cdots$, $a_n^{(2)}$ and call them "**activation units**".

> $a_i^{(j)}$ means "activation" of unit $i$ in layer $j$  
> $\Theta^{(j)}$ means matrix of weights controlling function mapping from layer $j$ to layer $j+1$

For example, if we have two features with two hidden layers, it may look like:


$$
\left[
\begin{matrix}
x_0 \\
x_1 \\
x_2 
\end{matrix}
\right]
\rightarrow
\left[
\begin{matrix}
a_1^{(2)} \\
a_2^{(2)} \\
a_3^{(2)} \\
a_4^{(2)}
\end{matrix}
\right]
\rightarrow
\left[
\begin{matrix}
a_1^{(3)} \\
a_2^{(3)}
\end{matrix}
\right]
\rightarrow
h_\theta(x)
$$

The values for each of the "activation" nodes is obtained as follows:

$$
a^{2} = g((\Theta^{(1)})^T \cdot x), \quad j=1
$$ 

$$
a^{(j+1)} = g((\Theta^{(j)})^T \cdot a^{(j)}), \quad j=2,3,\cdots,n
$$ 

where, 

$$
g(z) = \frac{1}{1 + e^{-z}}
$$

> **Example:** Applying neural networks is by predicting $x_1$ *AND* $x_2$, which is the logical '*AND*' operator and is only true if both $x_1$ and $x_2$ equal to 1. 

The graph of model will look like:  

$$
\left[
\begin{matrix}
x_0 \\
x_1 \\
x_2 
\end{matrix}
\right]
\rightarrow
\Big[ g(z^{(2)}) \Big]
\rightarrow
h_\Theta(x)
$$  

Assume that we set $\Theta$ martix as:  

$$
\Theta^{(1)} = \left[
\begin{matrix}
-30 \\
20 \\
20 
\end{matrix}
\right]
$$  

This will cause the output of our hypothesis to only be positive if both $x_1$ and $x_2$ are 1. In other words:  

$$
h_\Theta (x) = g((\Theta^{(1)})^T x) = g(-30+20x_1+20x_2)
$$  

Hypotheses are as showed below:  

$x_1$ | $x_2$ | $x_1$ *AND* $x_2$  
 :-: | :-: | :-:  
  0 | 0 | $g(-30) \approx 0$  
  0 | 1 | $g(-10) \approx 0$  
  1 | 0 | $g(-10) \approx 0$  
  1 | 1 | $g(+10) \approx 1$








## 3 Multiclass Classification

To classify data into multiple classes, we let our hypothesis function return a vector of values. Say we wanted to classify our data into one of categories.

![Neural Network]({{site.url}}/img/posts/{{page.title}}/neutral_network_representation_multi.png)

For example, if we want to classify our data into 3 categories with an one-hidden-layer neural network showed above, we can define our set of resulting classes as $y$ and $h_\theta(x)$:

$$
y,h_\theta(x) \in \left\{ 
\left[
\begin{matrix}
1 \\
0 \\
0 
\end{matrix}
\right],
\left[
\begin{matrix}
0 \\
1 \\
0 
\end{matrix}
\right],
\left[
\begin{matrix}
0 \\
0 \\
1 
\end{matrix}
\right]
\right\}
$$


