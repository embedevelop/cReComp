# cReComp

creator for Reconfigurable hw Component  

**Git**:         https://github.com/kazuyamashi/cReComp.git  
**Author**:      Kazushi Yamashina (Utsunomiya University)  
**Copyright**:   2016, Kazushi Yamashina  
**License**:      new BSD License   
**Latest Version**: 1.5.2  
**Contact**: 	 kazushi_at_virgo.is.utsunomiya-u.ac.jp  or [Twitter](https://twitter.com/KazushihsuzaK) or [Facebook](https://www.facebook.com/kazushi.yamashina?fref=nf)


# What is the cReComp?

The cReComp is a **code generator and framework for componentization of a single hardware or the multiple hardware**. The component generated by the cReComp is HW/SW co-system that is connected between CPU and FPGA (reconfigurable hw). The cReComp is possible to debug and test single hardware with software in a user development phase. When the development of a each hardware have been finished, the cReComp generates one of the HW/SW co-system by integrating the each of the hardware.

# cReComp supports ROS
[ROS](http://www.ros.org/) is an open source project by OSRF (Open Source Robotics Foundation). It is not an operating system but a software platform for component-oriented development of robotic application software on an OS. Communication library and a build system for robotic application software are provided in ROS. cReComp can generated ROS-compliant component which is included FPGA processing.

# Update
- 2016/11/29 version 1.5.1
	- Added testbench generation. You can generate a testbench with option "-t".
- 2016/11/29 version 1.5.0
	- cReComp can generate a ROS package with Python code. So, you can use the component more easy.
	- The Component generation with C++ is unable, since the function is debugging now.
- 2016/07/25 version 1.4.0
	- scrp_parser was improved functionally and become to be able to parse more accurately
- 2016/07/05 version 1.3.0
	- **scrp** supported ROS packages generation
- 2016/07/04 version 1.1.0 & 1.2.0
	- cReComp supported configuration with **scrp** (specification for cReComp)  
	- cReComp supported ROS package generation
- 2016/06/30 version 1.0.0
	- Released first version
	
# Installation

## Requirements

#### Platform

Ubuntu or OSX (Mac)  
Bash on Ubuntu on Windows may be OK.  

#### Python (2.7 later, not 3.0)  

```
sudo apt-get install python
```

#### Icarus Verilog  

Ubuntu

```
sudo apt-get install iverilog
```

Mac

```
brew install icarus-verilog
```

#### Jinja2  

```
pip install jinja2
```

#### [pyverilog](https://github.com/PyHDI/pyverilog)  

```
 git clone https://github.com/PyHDI/pyverilog.git
 cd pyverilog/
 python setup.py install
```

#### [veriloggen](https://github.com/PyHDI/veriloggen)  

```
 git clone https://github.com/PyHDI/veriloggen.git
 cd veriloggen/
 python setup.py install
```


## Install cReComp

**Download from github & install**

```
git clone https://github.com/kazuyamashi/cReComp.git
cd cReComp/
python setup.py install
```

**Package install**

```
pip install crecomp
```

# Command usage

```
Options:
Usage: crecomp [option] [file name] [-u user logic path]+

Options:
  -h, --help            show this help message and exit
  -u USERLOGIC, --userlogic=USERLOGIC
                        specifier your user logic name
  -p PYTHON_TEMPLATENAME, --python_template=PYTHON_TEMPLATENAME
                        specifier for template name
  -s SCRP_TEMPLATENAME, --scrp_template=SCRP_TEMPLATENAME
                        specifier for template name
  -b SCRP_PATH, --build=SCRP_PATH
                        specifier target scrp file to build for componentize
  -t TEST_PATH, --test=TEST_PATH
                        generate testbench of target user logic
```

# Getting Started

[Getting Started English](https://kazuyamashi.github.io/crecomp_doc/getting_started_en.html)  
[Getting Started Japanese](https://kazuyamashi.github.io/crecomp_doc/getting_started_jp.html)  

# Publication
1. Kazushi Yamashina, Takeshi Ohkawa, Kanemitsu Ootsu, Takashi Yokota, ``cReComp: Automated Design Tool for ROS-Compliant FPGA Component,'' IEEE 10th International Symposium on Embedded Multicore/Many-core Systems-on-Chip (MCSoC-16) @ Lyon, France, 2016.9
- Kazushi Yamashina, Takeshi Ohkawa, Kanemitsu Ootsu, Takashi Yokota, ``Functional improvement of cReComp Design tool for software-component generation of FPGA processing, RECONF @ Toyama, Japan, 2016.9
- Kazushi Yamashina, Hitomi Kimura, Takeshi Ohkawa, Kanemitsu Ootsu, Takashi Yokota, ``Automatic Design Environment for Componentization of an FPGA Processing in ROS,'' Annual Conference of the Institute of Systems, Control and Information Engineers, SCI'16 @ Kyoto, Japan, 2016.5
