#!/bin/bash

# Clone the main repository
git clone https://github.com/replicate/flux-fine-tuner
cd flux-fine-tuner

# Remove existing directories
rm -rf ai-toolkit LLava

# Clone and checkout the specific LLaVA repository and commit
git clone https://github.com/haotian-liu/LLaVA
cd LLaVA
git checkout c121f0432da27facab705978f83c4ada465e46fd
cd ..

# Clone and set up the ai-toolkit repository
git clone https://github.com/ostris/ai-toolkit
cd ai-toolkit
git checkout 86b5938cf35bde7b1eab33a001515433b01a7b63
git submodule update --init --recursive

# Set up Python virtual environment and install dependencies
python3 -m venv venv
source venv/bin/activate
pip3 install torch
pip3 install -r requirements.txt


sudo curl -o /usr/local/bin/cog -L "https://github.com/replicate/cog/releases/latest/download/cog_$(uname -s)_$(uname -m)"
sudo chmod +x /usr/local/bin/cog