/**
 * 修复 natives 包在高版本 Node.js 中的兼容性问题
 * 这个脚本为 natives 包提供了必要的 polyfill，解决 "primordials is not defined" 错误
 */

// 检查当前 Node.js 版本
const nodeVersion = process.versions.node;
const majorVersion = parseInt(nodeVersion.split('.')[0], 10);

console.log(`当前 Node.js 版本: ${nodeVersion}`);

if (majorVersion >= 12) {
  console.log('检测到 Node.js 12+ 版本，应用 natives 包兼容性修复...');
  
  // 为 process.binding 提供 polyfill
  if (!global.primordials) {
    global.primordials = {};
  }
  
  try {
    // 修改 natives 模块路径
    const nativesPath = require.resolve('natives');
    const fs = require('fs');
    const path = require('path');
    
    // 读取原始文件内容
    let content = fs.readFileSync(nativesPath, 'utf8');
    
    // 检查文件是否已经被修补
    if (!content.includes('// PATCHED FOR NODE 12+')) {
      console.log(`正在修补文件: ${nativesPath}`);
      
      // 创建备份
      const backupPath = `${nativesPath}.backup`;
      if (!fs.existsSync(backupPath)) {
        fs.writeFileSync(backupPath, content, 'utf8');
        console.log(`已创建备份: ${backupPath}`);
      }
      
      // 添加兼容性代码到文件顶部
      const patch = `// PATCHED FOR NODE 12+\n// This patch adds compatibility with Node.js 12+ for the natives package\nif (!process.binding) {\n  process.binding = function(name) {\n    if (name === 'natives') {\n      return require('module').builtinModules.reduce((obj, mod) => {\n        obj[mod] = true;\n        return obj;\n      }, {});\n    }\n    return {};\n  };\n}\n\n`;
      
      // 应用补丁
      content = patch + content;
      fs.writeFileSync(nativesPath, content, 'utf8');
      console.log('补丁已成功应用！');
      
      console.log('\n现在您可以尝试重新运行 npm install --legacy-peer-deps');
    } else {
      console.log('文件已经被修补过，无需再次修补。');
    }
  } catch (err) {
    console.error('应用补丁时出错:', err);
    console.log('\n您可以尝试以下替代方案:');
    console.log('1. 使用 Node.js 10.x 版本');
    console.log('2. 全局安装 gulp-cli 并修改 package.json');
    console.log('   npm install -g gulp-cli@2.3.0');
    console.log('   然后修改 package.json 中的 dist:style 脚本为:');
    console.log('   "dist:style": "gulp-cli --gulpfile build/build-style.js"');
  }
} else {
  console.log('当前 Node.js 版本兼容 natives 包，无需修复。');
}