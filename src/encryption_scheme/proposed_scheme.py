#importing required libraries
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms
import os
from PIL import Image
import time
import psutil

#memory and time start
start_memory = psutil.virtual_memory().used
start_time = time.time()

# Reading the encryption key
with open(r"C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\code_minor_project\src\encryption_scheme\keystream.txt", 'rb') as key_file:      
    keystream = [int(float(num)) for line in key_file for num in line.split()]
key_bytes = bytes(keystream[:32])
# IV generation
iv = os.urandom(16)
# Opening image 
image_path = r"C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\code_minor_project\src\image_dataset\128 x 128.png"
plain_image = Image.open(image_path)
image_bytes = plain_image.tobytes()
#cipher object created
chacha20_cipher = Cipher(algorithms.ChaCha20(key_bytes, iv),mode=None)
#encryption
chacha20_encryptor = chacha20_cipher.encryptor()
encrypted_image_bytes = chacha20_encryptor.update(image_bytes) + chacha20_encryptor.finalize()
encrypted_image = Image.frombytes('RGB', plain_image.size, encrypted_image_bytes)
encrypted_image_path = r"C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\code_minor_project\src\encryption_scheme\128_encrypted.png"
encrypted_image.save(encrypted_image_path)
print("Encrypted Image Saved at:", encrypted_image_path)
#decryption
chacha20_decryptor = chacha20_cipher.decryptor()
decrypted_image_bytes = chacha20_decryptor.update(encrypted_image_bytes) + chacha20_decryptor.finalize()
decrypted_image = Image.frombytes('RGB', encrypted_image.size, decrypted_image_bytes)
decrypted_image_path = r"C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\code_minor_project\src\encryption_scheme\128_decrypted.png"
decrypted_image.save(decrypted_image_path)
print("Decrypted Image Saved at:", decrypted_image_path)

#time and memory end
elapsed_time = time.time() - start_time
end_memory = psutil.virtual_memory().used
memory_used = end_memory - start_memory
print("end-to-end time taken:", elapsed_time, "seconds")
print("end-to-end memory usage:", memory_used / (1024 * 1024), "MB")



