# 函数区
runBook(){
    echo 运行中
    gitbook serve
}
delCache(){
    echo 删除缓存中
    rm -r ./_book/
    rm ./node_modules/gitbook-plugin-multilingual-index/_layouts/website/index_generated.html
}

helloWorld(){    
    echo 关于Shell请见 
    echo https://www.runoob.com/linux/linux-shell-func.html
}
fixBug(){
    echo 修复多语言插件的bug
    rm ./_book/index.html
    cp ./index.html ./_book/index.html
}
# 命令区

helloWorld
sleep 1
delCache
sleep 1
# 运行书本,并在10秒后修复bug
# 如果倒过来就变成了, 等20秒,运行书本,等到书本关闭在修复bug,本末倒置
# 如果文章非常多,那么这个20可以改多一些
runBook& sleep 20
fixBug

echo 如果出现端口占用请查阅
echo https://jingyan.baidu.com/article/fdffd1f89a0c8af3e98ca10e.html