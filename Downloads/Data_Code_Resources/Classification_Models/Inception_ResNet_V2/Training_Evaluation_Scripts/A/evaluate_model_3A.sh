#!/bin/bash
#
# This script performs the following operations:
# 1. Evaluates the model on the IRMA 3A validation set.

# Where the pre-trained InceptionResV2 checkpoint is saved to.
PRETRAINED_CHECKPOINT_DIR=/home/pelka/Documents/checkpoints

# Where the training (fine-tuned) checkpoint and logs will be saved to.
TRAIN_DIR=/datashare/ImageCLEF/IRMA/ImageCLEF2008/sp/03/A/modelsResV2

# Where the dataset is saved to.
DATASET_DIR=/datashare/ImageCLEF/IRMA/ImageCLEF2008/sp/03/A

export CUDA_DEVICE_ORDER=PCI_BUS_ID
export CUDA_VISIBLE_DEVICES=1


# Run evaluation.
python eval_image_classifier.py \
  --checkpoint_path=${TRAIN_DIR} \
  --eval_dir=${TRAIN_DIR} \
  --dataset_name=irma3A \
  --dataset_split_name=validation \
  --dataset_dir=${DATASET_DIR} \
  --model_name=inception_resnet_v2

# Run evaluation.
python eval_image_classifier.py \
  --checkpoint_path=${TRAIN_DIR}/all \
  --eval_dir=${TRAIN_DIR}/all \
  --dataset_name=irma3A \
  --dataset_split_name=validation \
  --dataset_dir=${DATASET_DIR} \
  --model_name=inception_resnet_v2
