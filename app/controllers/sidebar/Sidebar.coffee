Spine   = require('spine')
SidebarList = require('controllers/sidebar/List')
SidebarShow = require('controllers/sidebar/Show')



class Sidebar extends Spine.Stack
  controllers:
    list: SidebarList
    show: SidebarShow

module.exports = Sidebar