module.exports = {
	devServer: {
        port: 8080,     // 端口
    },
	pluginOptions: {
	    quasar: {
	      	importStrategy: 'kebab',
	      	rtlSupport: false
	    }
	},
	transpileDependencies: [
	    'quasar'
	]
}
