使用Sidecar代理远程Python服务，端口为Python的Web端口
当然，换成Node的Web端口，即可代理Node的远程服务
远程服务需要实现一个接口，返回

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Node：
app.get('/health', (req, res) => {
    res.json({
        status: 'UP'
    })
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Python：
class HealthHandler(tornado.web.RequestHandler):
    def get(self):
        self.set_header("content-type", "application/json")
        self.render('health')

health：
{"status":"UP"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

切记，通过此代理访问不到远程Python提供的服务，
需通过ace-sidecar-client-demo封装后才可访问到。