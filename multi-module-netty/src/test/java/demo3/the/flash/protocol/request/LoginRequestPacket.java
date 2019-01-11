package demo3.the.flash.protocol.request;

import lombok.Data;
import demo3.the.flash.protocol.Packet;

import static demo3.the.flash.protocol.command.Command.LOGIN_REQUEST;

/**
 * 登录请求数据包
 */
@Data
public class LoginRequestPacket extends Packet {
    private String userName;

    private String password;

    @Override
    public Byte getCommand() {

        return LOGIN_REQUEST;
    }
}
