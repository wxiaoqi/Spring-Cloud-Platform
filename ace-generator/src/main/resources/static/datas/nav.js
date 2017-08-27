var navs = [{
    "title": "基础配置管理",
    "icon": "fa-area-chart",
    "href": "",
    "spread": true,
    "children": [{
        "title": "用户管理",
        "icon": "fa-user",
        "href": "user"
    }, {
        "title": "菜单管理",
        "icon": "fa-list",
        "href": "menu"
    }, {
        "title": "用户组管理",
        "icon": "fa-users",
        "href": "http://localhost:8765/user"
    }, {
        "title": "数据字典",
        "icon": "fa-book",
        "href": "http://localhost:8764/hystrix"
    }]
}, {
    "title": "系统监控",
    "icon": "fa-area-chart",
    "href": "",
    "spread": false,
    "children": [{
        "title": "Spring-Boot监控",
        "icon": "fa-line-chart",
        "href": "http://localhost:8764"
    }, {
        "title": "Hystrix监控",
        "icon": "fa-bar-chart",
        "href": "http://localhost:8764/hystrix"
    }]
}];