package demo3.the.flash.protocol.request;

import lombok.Data;
import demo3.the.flash.protocol.Packet;

import java.util.List;

import static demo3.the.flash.protocol.command.Command.CREATE_GROUP_REQUEST;

@Data
public class CreateGroupRequestPacket extends Packet {

    private List<String> userIdList;

    @Override
    public Byte getCommand() {

        return CREATE_GROUP_REQUEST;
    }
}
