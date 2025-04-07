# 构建说明

## 文件命名

为了避免与原iview库冲突，以下文件已重命名：

- `iview.js` → `atm-ds.js`
- `iview.min.js` → `atm-ds.min.js`
- `iview.css` → `atm-ds.css`

## 引用方式

请使用以下方式引用样式和组件：

```js
// 引入样式
import 'atmDs/dist/styles/atm-ds.css';

// 全局引入
import Vue from 'vue';
import AtmDS from 'atmDs';
Vue.use(AtmDS);

// 按需引入
import { Button, Table } from 'atmDs';
Vue.component('AtmButton', Button);
Vue.component('AtmTable', Table);
```

## 项目构建

执行以下命令重新构建项目：

```bash
npm run dist
```

## CSS类前缀

所有CSS类名前缀已从`ivu-`更改为`atm-`，例如：

- `ivu-btn` → `atm-btn`
- `ivu-table` → `atm-table` 