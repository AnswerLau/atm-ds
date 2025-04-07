<p align="center">
    <a href="https://github.com/AnswerLau/atm-ds">
        <img width="200" src="./assets/logo.png">
    </a>
</p>

<h1>
ATM Design System
    <h3>高质量的 UI 组件库，基于 Vue.js 构建</h3>
</h1>

## 文档

**[ATM Design System](https://github.com/AnswerLau/atm-ds)**

## 特性

- 数十种实用且美观的组件
- 友好的 API，适合各种技能水平的人
- 详尽的文档和示例
- 优雅的设计风格
- 支持 Vue.js 2.x

## 安装

使用 npm 安装:
```
npm install atm-ds --save
```

使用 script 标签全局引入:
```html
<script type="text/javascript" src="atm-ds.min.js"></script>
<link rel="stylesheet" href="dist/styles/atm-ds.css">
```

## 使用

### 完整引入

```js
import Vue from 'vue';
import AtmDS from 'atm-ds';
import 'atm-ds/dist/styles/atm-ds.css';

Vue.use(AtmDS);
```

### 按需引入组件

```js
import Vue from 'vue';
import { AtmButton, AtmSlider } from 'atm-ds';
import 'atm-ds/dist/styles/atm-ds.css';

Vue.component('AtmButton', AtmButton);
Vue.component('AtmSlider', AtmSlider);
```

### 组件使用示例

```vue
<template>
    <atm-slider v-model="value" range />
</template>
<script>
    export default {
        data () {
            return {
                value: [20, 50]
            }
        }
    }
</script>
```

### CSS引入方式
```js
import 'atm-ds/dist/styles/atm-ds.css';
```

## 兼容性

- 支持 Vue.js 2.x
- 支持 SSR
- 支持 [Nuxt.js](https://nuxtjs.org/)
- 支持 TypeScript
- 支持 [Electron](http://electron.atom.io/)
- 大多数组件和功能支持 IE9 及以上浏览器，有些组件和功能不支持 IE

## 社区

如果您想贡献代码或报告问题:

**问题:** 在 [GitHub Issues](https://github.com/AnswerLau/atm-ds/issues) 提交问题  
**贡献:** 欢迎提交 PR!

## 许可证
[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2023-present, ATM Design System
