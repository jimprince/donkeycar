# Donkey: a self driving library for small scale DIY vehicles. 

Donkey is minimalist and modular self driving library written in Python. It is developed with a focus on being easily accessable and allowing fast experimentation. 

Use Donkey if you want to:
* quickly [build your own self driving RC Car]((docs/get_started.md) with a Raspbery Pi.
* test out your self driving idea 


Guiding Principles
* **Modularity**: A self driving system is composed of standalone, independently configurable modules that can be connected modules.

* **Minimalism**: Each component should be kept short (<100 lines of code). Each peice of code should be transparent apon first reading. No black magic, it slows the speed of innovation. 

* **Extensiblity**: New components should be simple to create by following a template. 

* **Python**: Keep it simple. 

*** These guidelines are nearly copied from Keras because they are so good *** 



## Get started.
Once you have built your car this how you use Donkey.

#### Drive your car from your computer.

1. Start driving mode. 
```
python manage.py drive --session sidewalk --model cnn-sidewalk 
```

2. Go to `<pi_ip_address>:8887` in your browser to control the car.


### Train a self driving pilot for a route. 

```
python manage.py train --session sidewalk --model my-model
```




