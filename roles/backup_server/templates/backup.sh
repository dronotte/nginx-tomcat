backup_clients=( {{ groups['backup_client']|join(' ') }} )
backup_directories=( /etc/nginx  )
DATE=$(date +"%m-%d-%Y-%H-%M")
logfile=/var/log/backup.log
#exec 1>/var/log/backup.log
#exec 2>/var/log/backup.log
for client in ${backup_clients[*]}
do
  for directory in $backup_directories
  do
    echo $directory
    dir=/data/backup/$client/$DATE
    echo "mkdir -p $dir"
    mkdir -p $dir
    echo "scp -r $client:$directory/* $dir/"
    scp $client:$directory/* $dir/
    echo "tar -czvf $dir.tar.gz $dir/*"
    tar -czvf $dir.tar.gz $dir/*
    echo "rm -rf $dir"
    rm -rf $dir 
  done
done
