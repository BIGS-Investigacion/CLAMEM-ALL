DATABASE=example
#DATA_DIRECTORY=/media/jorge/hd1/patologia_digital/data/publicas/CPTAC-BRCA/BRCA
#DATA_DIRECTORY=/media/jorge/SP_PHD_U3/perfil_molecular/publicas/CPTAC-BRCA/BRCA
CSV_FILE_NAME=data/dataset_csv/example.csv
DATA_DIRECTORY=data/example
PATCHES_DIRECTORY=.patches/$DATABASE
PATCH_SIZE=256
PRESET_CSV=tcga.csv
SLIDE_EXT=.svs
CUDA_DEV=0

python src/create_patches_fp.py --source $DATA_DIRECTORY --save_dir $PATCHES_DIRECTORY --patch_size $PATCH_SIZE --preset $PRESET_CSV --seg --patch --stitch

python src/bigs_auxiliar/downloader.py

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_cnn
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT

#Download pretrained model  ctranspath.pth from https://github.com/Xiyue-Wang/TransPath.git
export GENERIC_CKPT_PATH=.checkpoint/ctranspath/ctranspath.pth
BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_ctranspath
MODEL_NAME=ctranspath
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME


#Download pretrained model best_ckpt.pth from https://github.com/Xiyue-Wang/RetCCL
export GENERIC_CKPT_PATH='.checkpoint/retccl/best_ckpt.pth'
BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_retccl
MODEL_NAME=retccl
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

export CONCH_CKPT_PATH='.checkpoint/conch/pytorch_model.bin'
BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_conch
MODEL_NAME=conch_v1
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

export UNI_CKPT_PATH='.checkpoint/uni/pytorch_model.bin'
BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_uni
MODEL_NAME=uni_v1
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_provgigapath
MODEL_NAME=provgigapath
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_hibou_b
MODEL_NAME=hibou_b
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_hibou_l
MODEL_NAME=hibou_l
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_hoptimus0
MODEL_NAME=hoptimus0
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_virchow
MODEL_NAME=virchow
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_phikon
MODEL_NAME=phikon
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_musk
MODEL_NAME=musk
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME

export UNI_CKPT_PATH='.checkpoint/uni_2/pytorch_model.bin'
BATCH_SIZE=2048
FEATURES_DIRECTORY=.features/$DATABASE/features_uni_2
MODEL_NAME=uni_v2
CUDA_VISIBLE_DEVICES=$CUDA_DEV python src/extract_features_fp.py --data_h5_dir $PATCHES_DIRECTORY --data_slide_dir $DATA_DIRECTORY --csv_path $CSV_FILE_NAME --feat_dir $FEATURES_DIRECTORY --batch_size $BATCH_SIZE --slide_ext $SLIDE_EXT --model_name $MODEL_NAME