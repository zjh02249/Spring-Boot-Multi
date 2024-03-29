/*
package com.highcharts.shiro.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.highcharts.shiro.domain.FrontPage;
import com.highcharts.shiro.domain.UserOnlineBo2;
import com.highcharts.shiro.dao.UserTwoMapper;
import com.highcharts.shiro.domain.UserTwo;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.crazycake.shiro.RedisSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

*/
/**
 * @program: Spring-Boot-Multi
 * @description:
 * @author: Brucezheng
 * @create: 2018-08-10 15:29
 **//*

@Service
public class UserService extends ServiceImpl<UserTwoMapper, UserTwo> {

    @Autowired
    RedisSessionDAO redisSessionDAO;

    @Autowired
    SessionManager sessionManager;
    //获取在线session的page对象
    public Page<UserOnlineBo2> getPagePlus(FrontPage<UserOnlineBo2> frontPage) {
        // 因为我们是用redis实现了shiro的session的Dao,而且是采用了shiro+redis这个插件
        // 所以从spring容器中获取redisSessionDAO
        // 来获取session列表.
        Collection<Session> sessions = redisSessionDAO.getActiveSessions();
        Iterator<Session> it = sessions.iterator();
        List<UserOnlineBo2> onlineUserList = new ArrayList<UserOnlineBo2>();
        Page<UserOnlineBo2> pageList = frontPage.getPagePlus();
        // 遍历session
        while (it.hasNext()) {
            // 这是shiro已经存入session的
            // 现在直接取就是了
            Session session = it.next();
            //标记为已提出的不加入在线列表
            if(session.getAttribute("kickout")==null?false:true)continue;
            UserOnlineBo2 onlineUser = getSessionBo(session);
            if(onlineUser!=null){
                onlineUserList.add(onlineUser);
            }
        }
        // 再将List<UserOnlineBo>转换成mybatisPlus封装的page对象
        int page = frontPage.getPage() - 1;
        int rows = frontPage.getRows() - 1;
        int startIndex = page * rows;
        int endIndex = (page * rows) + rows;
        int size = onlineUserList.size();
        if (endIndex > size) {
            endIndex = size;
        }
        pageList.setRecords(onlineUserList.subList(startIndex, endIndex));
        pageList.setTotal(size);
        return pageList;
    }

    //根据sessionId执行强制退出
    public void kickout(Serializable sessionId){
        this.getSessionBysessionId(sessionId).setAttribute("kickout", true);
    }

    //根据sesisonid获取单个session对象
    private Session getSessionBysessionId(Serializable sessionId){
        Session kickoutSession = sessionManager.getSession(new DefaultSessionKey(sessionId));
        return kickoutSession;
    }

    //从session中获取UserOnline对象
    private UserOnlineBo2 getSessionBo(Session session){
        //获取session登录信息。
        Object obj = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
        if(null == obj){
            return null;
        }
        //确保是 SimplePrincipalCollection对象。
        if(obj instanceof SimplePrincipalCollection){
            SimplePrincipalCollection spc = (SimplePrincipalCollection)obj;
            */
/**
             * 获取用户登录的，@link SampleRealm.doGetAuthenticationInfo(...)方法中
             * return new SimpleAuthenticationInfo(user,user.getPswd(), getName());的user 对象。
             *//*

            obj = spc.getPrimaryPrincipal();
            if(null != obj && obj instanceof UserTwo){
                //存储session + user 综合信息
                UserOnlineBo2 userBo = new UserOnlineBo2((UserTwo)obj);
                //最后一次和系统交互的时间
                userBo.setLastAccess(session.getLastAccessTime());
                //主机的ip地址
                userBo.setHost(session.getHost());
                //session ID
                userBo.setSessionId(session.getId().toString());
                //session最后一次与系统交互的时间
                userBo.setLastLoginTime(session.getLastAccessTime());
                //回话到期 ttl(ms)
                userBo.setTimeout(session.getTimeout());
                //session创建时间
                userBo.setStartTime(session.getStartTimestamp());
                //是否踢出
                userBo.setSessionStatus(false);
                return userBo;
            }
        }
        return null;
    }
}
*/
