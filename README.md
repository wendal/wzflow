## wzflow

Nutzwx 1.x 与activiti集成的demo, 是"大鲨鱼"弄的,我只是补充修改一下

## 数据库导入

windows下导入, 如果是控制台,必须先切换编码

```
chcp 65001
mysql -uroot -p wzflow < wzflow_init.sql
```

## 项目启动

这是一个maven工程, 且必须部署在网站的根目录

```
mvn jetty:run
```