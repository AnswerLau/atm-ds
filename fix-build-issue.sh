#!/bin/bash

# 解决 iView 构建中的 "primordials is not defined" 错误
# 这个脚本提供两种解决方案：
# 1. 使用 nvm 切换到兼容的 Node.js 版本
# 2. 不使用 nvm 的替代方案

echo "===== iView 构建兼容性修复脚本 ====="
echo "当前 Node.js 版本: $(node -v)"

# 检查是否安装了 nvm
if command -v nvm &> /dev/null; then
    echo "检测到 nvm，将尝试切换到兼容的 Node.js 版本..."
    
    # 安装并使用 Node.js 10.x (与 gulp 3.x 兼容)
    nvm install 10
    nvm use 10
    
    echo "已切换到 Node.js $(node -v)"
    echo "现在尝试重新安装依赖并构建:"
    echo "npm install --legacy-peer-deps"
    
    exit 0
fi

echo "未检测到 nvm，提供替代解决方案:"
echo ""
echo "方案 1: 安装 nvm 并使用兼容的 Node.js 版本"
echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash"
echo "然后重启终端并运行此脚本"
echo ""
echo "方案 2: 修改 package.json 中的构建脚本，使用 gulp-cli 替代 gulp"
echo "npm install -g gulp-cli@2.3.0"
echo "然后修改 package.json 中的 dist:style 脚本为:"
echo '"dist:style": "gulp-cli --gulpfile build/build-style.js"'
echo ""
echo "方案 3: 使用 Docker 容器运行兼容的 Node.js 环境"
echo "docker run -it --rm -v $(pwd):/app -w /app node:10 npm install --legacy-peer-deps"
echo ""
echo "方案 4: 使用 n 模块管理 Node.js 版本"
echo "npm install -g n"
echo "sudo n 10.24.1"
echo "然后重新打开终端"