#!/bin/bash
#
# This script performs the following operations:
# 1. Fine-tunes an InceptionResNetV2 model on the IRMA 7B training set.
#

# Where the pre-trained InceptionResNetV2 checkpoint is saved to.
PRETRAINED_CHECKPOINT_DIR=/home/obi/Documents/checkpoints

# Where the training (fine-tuned) checkpoint and logs will be saved to.
TRAIN_DIR=/home/obi/Documents/sp/07/B/modelsResV2

# Where the dataset is saved to.
DATASET_DIR=/home/obi/Documents/sp/07/B


# Fine-tune only the new layers for 1000 steps.
python train_image_classifier.py \
  --train_dir=${TRAIN_DIR} \
  --dataset_name=irma7B \
  --dataset_split_name=train \
  --dataset_dir=${DATASET_DIR} \
  --model_name=inception_resnet_v2 \
  --checkpoint_path=${PRETRAINED_CHECKPOINT_DIR}/inception_resnet_v2_2016_08_30.ckpt \
  --checkpoint_exclude_scopes=InceptionResnetV2/Logits,InceptionResnetV2/AuxLogits \
  --trainable_scopes=InceptionResnetV2/Logits,InceptionResnetV2/AuxLogits \
  --max_number_of_steps=1000 \
  --batch_size=32 \
  --learning_rate=0.01 \
  --learning_rate_decay_type=fixed \
  --save_interval_secs=60 \
  --save_summaries_secs=60 \
  --log_every_n_steps=100 \
  --optimizer=rmsprop \
  --weight_decay=0.00004


# Fine-tune all the new layers for 10000 steps.
python train_image_classifier.py \
  --train_dir=${TRAIN_DIR}/all \
  --dataset_name=irma7B \
  --dataset_split_name=train \
  --dataset_dir=${DATASET_DIR} \
  --model_name=inception_resnet_v2 \
  --checkpoint_path=${TRAIN_DIR} \
  --max_number_of_steps=10000 \
  --batch_size=32 \
  --learning_rate=0.01 \
  --learning_rate_decay_type=exponential \
  --save_interval_secs=60 \
  --save_summaries_secs=60 \
  --log_every_n_steps=10 \
  --optimizer=rmsprop \
  --weight_decay=0.00004

