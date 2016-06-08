
time for fn in ~/ashdm/files/RS03ASHS/PN03B/06-CAMHDA301/2016/04/04/*.mp4; do
    python code/calculate_video_statistics.py $fn
done

time for fn in results/RollingVariance*.csv; do
    ts=`echo $fn | cut -d'_' -f2 | cut -d'.' -f1`
    python code/extract_scenes.py $fn results/bounds_$ts.csv
done

pushd ~/ashdm

time python index_videos.py --src-uri gs://bdmyers_escience_camhd/files/RS03ASHS/PN03B/06-CAMHDA301/2016/04/04 --find-scene-bounds --cache-input-videos --method='1d-variance'
time python index_videos.py --src-uri gs://bdmyers_escience_camhd/files/RS03ASHS/PN03B/06-CAMHDA301/2016/04/04 --dst-uri gs://bdmyers_escience_camhd/files/RS03ASHS/PN03B/06-CAMHDA301/2016/04/04/1dvariance --cache-input-videos --method='1d-variance'

popd
