<template>
    <li :class="classes">
        {{ data.label }}
        <Icon :type="arrowType" :custom="customArrowType" :size="arrowSize" v-if="showArrow" />
        <i v-if="showLoading" class="atm-icon atm-icon-ios-loading atm-load-loop atm-cascader-menu-item-loading"></i>
    </li>
</template>
<script>
    import Icon from '../icon/icon.vue';

    export default {
        name: 'Casitem',
        components: { Icon },
        props: {
            data: Object,
            prefixCls: String,
            tmpItem: Object
        },
        computed: {
            classes () {
                return [
                    `${this.prefixCls}-menu-item`,
                    {
                        [`${this.prefixCls}-menu-item-active`]: this.tmpItem.value === this.data.value,
                        [`${this.prefixCls}-menu-item-disabled`]: this.data.disabled
                    }
                ];
            },
            showArrow () {
                return (this.data.children && this.data.children.length) || ('loading' in this.data && !this.data.loading);
            },
            showLoading () {
                return 'loading' in this.data && this.data.loading;
            },
            // 3.4.0, global setting customArrow 有值时，arrow 赋值空
            arrowType () {
                let type = 'ios-arrow-forward';

                if (this.$ATM_DS) {
                    if (this.$ATM_DS.cascader.customItemArrow) {
                        type = '';
                    } else if (this.$ATM_DS.cascader.itemArrow) {
                        type = this.$ATM_DS.cascader.itemArrow;
                    }
                }
                return type;
            },
            // 3.4.0, global setting
            customArrowType () {
                let type = '';

                if (this.$ATM_DS) {
                    if (this.$ATM_DS.cascader.customItemArrow) {
                        type = this.$ATM_DS.cascader.customItemArrow;
                    }
                }
                return type;
            },
            // 3.4.0, global setting
            arrowSize () {
                let size = '';

                if (this.$ATM_DS) {
                    if (this.$ATM_DS.cascader.itemArrowSize) {
                        size = this.$ATM_DS.cascader.itemArrowSize;
                    }
                }
                return size;
            }
        }
    };
</script>
