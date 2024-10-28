# 不通过网络本地同步commit
Local-synchronous-commit

可以不通过网络来同步不同人的commit提交

/e/git_backup/donghaao_create_bundle.sh 能够创建一个backup.bundle文件

包含分支和提交

 /e/git_backup/donghaao_pull_bundle.sh e master

 将文件夹中的backup文件中的master内容merge进本地master之中
