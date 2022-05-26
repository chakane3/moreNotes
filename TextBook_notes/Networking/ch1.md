# Computer Networks + Internet

## What is the Internet?
It is a computer network that interconnects billions of machines. Any machine can be a **host** or **end system**. These end systems are connected together by a network of <b>communication links</b> and <b>packet switches</b>. Different communication links transmit data at different rates. The transmission rate of the data is measures in bits/second. When one end system has data to send to another end system, end system A will send the data in segments with header bytes added to each segment. The data being sent as a whole is called a <b>packet</b>. <br>

A packet switch takes a packet arriving via an communication link and forwards that packet on one of its outgoing communication links. The two most common packet switches are <b>routers</b> and <b>link-layer switches</b> which both forwards packets towards a destination. Link-layer switches are usually used in access networks while routers are used in the network core. <br>

End systems access the internet through ISP's, this includes residential ISPs, university ISPs. They provide access to WiFi and cellular data. Each ISP is a network itself made up of packet switches and communication links. The internet is mainly about connecting end systems together and ISPs provide access to end systems.<br>

End systems, packet switches, and other pieces of the internet run <b>protocols</b> that control the flow of data in the internet. The 2 most important protocols are TCP (Transmission Control Protocol) and IP (Internet Protocol).
<ul>
    <li>TCP - A communications standard which enable application programs and computing devices to exchange messages over a network. Its designed to send packets across the internet and ensure the delivery of dat and messages over networks. </li>
    <li>IP - Specifies the format of the packets that are being send and received among routers and end systems.</li>
</ul>

We can also think of the internet as a service which provides services to the applications we build. The applications we make are usually considered <b>distributed applications</b> since they involve multiple end systems which exchange data with each other. The applications we build run on the end systems, not in the packet switches or network core. <br>

End systems attached to the internet provide a <b>socket interface</b> that specifies how a program running on one end system asks the internet infrastructure to deliver data to a specific destination program running on another end system. The socket interface is a set of rules that the sending program must follow to that the internet can deliver the data to the destination program. 

### Network Protocols pg 8