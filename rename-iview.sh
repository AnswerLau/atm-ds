#!/bin/bash

# 替换所有vue文件中的$IVIEW为$ATM_DS
echo "替换所有组件中的$IVIEW为$ATM_DS..."
find ./src -name "*.vue" -exec sed -i '' 's/\$IVIEW/\$ATM_DS/g' {} \;

# 替换warning信息
echo "替换所有警告消息中的iView为ATM Design System..."
find ./src -name "*.js" -exec sed -i '' 's/\[iView warn\]/\[ATM Design System warn\]/g' {} \;

# 替换其他关键字
echo "替换其他iview关键字..."
find ./src -name "*.js" -exec sed -i '' 's/iview/atm-ds/g' {} \;

# 替换Vue文件中的CSS前缀 ivu- 为 atm-
echo "替换所有Vue文件中的CSS前缀 ivu- 为 atm-..."
find ./src -name "*.vue" -exec sed -i '' 's/ivu-/atm-/g' {} \;

# 替换Less文件中的CSS前缀
echo "替换所有Less文件中的CSS前缀..."
find ./src/styles -name "*.less" -exec sed -i '' 's/ivu-/atm-/g' {} \;

# 替换版权信息
echo "替换版权信息..."
sed -i '' 's/iView/ATM Design System/g' ./src/styles/copyright.less
sed -i '' 's/https:\/\/www.iviewui.com/https:\/\/github.com\/AnswerLau\/atm-ds/g' ./src/styles/copyright.less
sed -i '' 's/https:\/\/github.com\/iview\/iview/https:\/\/github.com\/AnswerLau\/atm-ds/g' ./src/styles/copyright.less

# 更新types中的Vue实例类型声明
echo "更新Vue实例类型声明..."
sed -i '' 's/\$IVIEW/\$ATM_DS/g' ./types/atm-ds.components.d.ts

# 提示完成
echo "批量替换完成！请检查是否有遗漏。" 