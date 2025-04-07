<template>
    <div :class="classes">
        <a
            v-if="to"
            :href="linkUrl"
            :target="target"
            class="atm-cell-link"
            @click.exact="handleClickItem($event, false)"
            @click.ctrl="handleClickItem($event, true)"
            @click.meta="handleClickItem($event, true)">
            <CellItem :title="title" :label="label" :extra="extra">
                <slot name="icon" slot="icon"></slot>
                <slot slot="default"></slot>
                <slot name="extra" slot="extra"></slot>
                <slot name="label" slot="label"></slot>
            </CellItem>
        </a>
        <div class="atm-cell-link" v-else @click="handleClickItem">
            <CellItem :title="title" :label="label" :extra="extra">
                <slot name="icon" slot="icon"></slot>
                <slot slot="default"></slot>
                <slot name="extra" slot="extra"></slot>
                <slot name="label" slot="label"></slot>
            </CellItem>
        </div>
        <div class="atm-cell-arrow" v-if="to">
            <slot name="arrow">
                <Icon :type="arrowType" :custom="customArrowType" :size="arrowSize" />
            </slot>
        </div>
    </div>
</template>
<script>
    import CellItem from './cell-item.vue';
    import Icon from '../icon/icon.vue';
    import mixinsLink from '../../mixins/link';

    const prefixCls = 'atm-cell';

    export default {
        name: 'Cell',
        inject: ['cellGroup'],
        mixins: [ mixinsLink ],
        components: { CellItem, Icon },
        props: {
            name: {
                type: [String, Number]
            },
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
            disabled: {
                type: Boolean,
                default: false
            },
            selected: {
                type: Boolean,
                default: false
            }
        },
        data () {
            return {
                prefixCls: prefixCls
            };
        },
        computed: {
            classes () {
                return [
                    `${prefixCls}`,
                    {
                        [`${prefixCls}-disabled`]: this.disabled,
                        [`${prefixCls}-selected`]: this.selected,
                        [`${prefixCls}-with-link`]: this.to
                    }
                ];
            },
            // 3.4.0, global setting customArrow 有值时，arrow 赋值空
            arrowType () {
                let type = 'ios-arrow-forward';

                if (this.$ATM_DS) {
                    if (this.$ATM_DS.cell.customArrow) {
                        type = '';
                    } else if (this.$ATM_DS.cell.arrow) {
                        type = this.$ATM_DS.cell.arrow;
                    }
                }
                return type;
            },
            // 3.4.0, global setting
            customArrowType () {
                let type = '';

                if (this.$ATM_DS) {
                    if (this.$ATM_DS.cell.customArrow) {
                        type = this.$ATM_DS.cell.customArrow;
                    }
                }
                return type;
            },
            // 3.4.0, global setting
            arrowSize () {
                let size = '';

                if (this.$ATM_DS) {
                    if (this.$ATM_DS.cell.arrowSize) {
                        size = this.$ATM_DS.cell.arrowSize;
                    }
                }
                return size;
            }
        },
        methods: {
            handleClickItem (event, new_window) {
                this.cellGroup.handleClick(this.name);

                this.handleCheckClick(event, new_window);
            }
        }
    };
</script>