#!/usr/bin/env bash
for i in 'twitter' 'twitter2015' # 'twitter'
do
    echo ${i}
    for k in 'MBert' 'TomBertNoPooling' 'MBertNoPooling' 'ResBert' 'TomBert'
    do
        echo ${k}
        for j in 'cls' 'both' # 'first'
        do
            echo ${j}
            PYTHONIOENCODING=utf-8 CUDA_VISIBLE_DEVICES=0 python run_multimodal_classifier.py --data_dir \
            ./absa_data/${i} --task_name ${i} --output_dir ./output/${i}_${k}_${j}_mm_output/ \
            --bert_model bert-base-uncased --do_train --do_eval --train_batch_size 32 --mm_model ${k} --pooling ${j}
        done
    done
done
