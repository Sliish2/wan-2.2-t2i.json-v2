# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.1.9
RUN comfy node install --exit-on-fail was-node-suite-comfyui@1.0.2
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511111955
RUN comfy node install --exit-on-fail cg-use-everywhere@7.5.0
RUN comfy node install --exit-on-fail comfyui_layerstyle@1.0.90
RUN comfy node install --exit-on-fail RES4LYF
RUN comfy node install --exit-on-fail comfyui-impact-subpack@1.3.5
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.25.1
RUN comfy node install --exit-on-fail ComfyUI_Comfyroll_CustomNodes

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors --relative-path models/diffusion_models --filename wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/text_encoders --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
RUN comfy model download --url https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/1x-ITF-SkinDiffDetail-Lite-v1.pth --relative-path models/upscale_models --filename 1x-ITF-SkinDiffDetail-Lite-v1.pth
RUN comfy model download --url https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8m.pt --relative-path models/ultralytics/bbox --filename face_yolov8m.pt
RUN comfy model download --url https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth --relative-path models/sams --filename sam_vit_b_01ec64.pth
RUN comfy model download --url https://huggingface.co/wavespeed/misc/resolve/main/upscalers/4xLSDIR.pth --relative-path models/upscale_models --filename 4xLSDIR.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
