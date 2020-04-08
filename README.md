# ZQDataGridComponentDemo
一个什么地方都可以自定义的表格


#效果图
![image](https://github.com/LiteratureZhiQing/ZQDataGridComponentDemo/blob/master/%E8%A1%A8%E6%A0%BC.gif)


#Pod 使用
pod 'ZQDataGridComponent'

#控件介绍
#一张粗糙的结构图
![image](https://github.com/LiteratureZhiQing/ZQDataGridComponentDemo/blob/master/%E8%A1%A8%E6%A0%BC%E7%BB%93%E6%9E%841.jpg)

1、左上角红色视图为 leftHeadView 需要使用者自己一个view 添加进去

2、左侧为leftTableView，cell类型有默认类型，也可以通过 ZQDataGridComponentModel 中leftTableViewCellClass属性注册

3、右上方rightHeadView 为 一个UICollectionView，它和rightTableView中cell的子视图类型相同

4、右下方主视图为rightTableView，cell类型为 ZQDataGridRightTableViewCell 


这个控件主要思路就是采用类型注册和方法签名预设,来实现表格的任何地方都可以自定义

具体代码参见本demo

如有疑问请Issues

