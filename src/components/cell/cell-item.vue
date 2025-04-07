<template>
    <div class="atm-cell-item">
        <div class="atm-cell-icon">
            <slot name="icon"></slot>
        </div>
        <div class="atm-cell-main">
            <div class="atm-cell-title"><slot>{{ title }}</slot></div>
            <div class="atm-cell-label"><slot name="label">{{ label }}</slot></div>
        </div>
        <div class="atm-cell-footer">
            <span class="atm-cell-extra"><slot name="extra">{{ extra }}</slot></span>
        </div>
    </div>
</template>
<script>
    export default {
        props: {
            title: {
                type: String,
                default: ''
            },
            label: {
                type: String,
                default: ''
            },
            extra: {
                type: String,
                default: ''
            },
        }
    };
</script>