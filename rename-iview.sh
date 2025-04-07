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

# 提示完成
echo "批量替换完成！请检查是否有遗漏。" 