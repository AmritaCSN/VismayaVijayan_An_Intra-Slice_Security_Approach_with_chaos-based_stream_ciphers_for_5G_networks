# An_Intra-Slice_Security_Approach_with_chaos-based_stream_ciphers_for_5G_networks
This repository has the codes used for the implementation of the project "An intra-Slice security approach with chaos-based stream ciphers for 5G networks".
## Project Overview
A image encryption scheme using the chaotic map 2D-LSCM for key stream generation and light weight ChaCha20 stream cipher for the encryption. This combination guarantees data confidentiality and security during transmission, particularly well-suited for resource-limited scenarios within the intra-slice domain. This work includes a comprehensive security analysis of proposed scheme and a comparative performance evaluation against alternative encryption schemes employing Baker’s map and Arnold’s cat map for key stream generation.
## Repository Overview

This repository is divided into 2 sections:

1. **/src** folder: Contains 3 folders `/encryption_scheme`, `/key_generation_chaotic_maps`, `/image_dataset`, and `/security_analysis`.
2. **Block Diagram of Proposed Scheme**: Contains the pictorial representation of the proposed scheme.

/src folder contains the sub-folders:
-------------------------------------

### 1. `/encryption_scheme`

This folder contains the codes for key generation and encryption of the proposed scheme.

- **`lscm_key.m`**: MATLAB code for the 2D-Logistic Sine Coupling Map used for keystream generation.
- **`proposed_scheme.py`**: Python code for the image encryption and decryption scheme using chacha20 stream cipher and the key stream generated from `lscm_key.m`.
### 2. `/key_generation_chaotic_maps`
This folder contains the codes for the key generation of baker's map and arnold's cat map for the comparison with the proposed scheme.
- **`arnolds_cat_map_key.m`**: MATLAB code for the Arnold's Cat Map used for keystream generation.
- **`bakers_map_key.m`**: MATLAB code for the Baker's Map used for keystream generation.
### 3. `/image_dataset`
This folder contains different images of different pixel sizes. Also contains `image_details` (.txt file) with details about all the images used for implementation and analysis.

### 4. `/security_analysis`

This folder contains code for the implementation of security analysis in Matlab.

- **Security Analysis Codes in Matlab**
    - `KeySensitivity_analysis.m`
    - `Histogram_Analysis.m`
    - `Entropy_Analysis.m`
    - `Differential_Cryptanalysis.m`
    - `Contrast_Analysis.m`
    - `PSNR_Analysis.m`
    - `Correlation_Analysis.m`

- **Pseudo Code for Time & Memory analysis** 
    - `Time_Analysis.txt`
    - `Memory_Analysis.txt`

## Architectural Block Diagram

The block diagram of the proposed encryption scheme is shown in `/Architectural_block_diagram.png`. ![Block Diagram](/Architectural_block_diagram.png)





