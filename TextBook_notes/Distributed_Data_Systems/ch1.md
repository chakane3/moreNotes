# Foundations of Data Systems
The 3 big ideas behind this book revolve around:
<ul>
    <li>Reliability - References to hardware/software faults and human error. The system should continue to work correctly even in the face of adversity</li>
    <li>Scalability - Measurng load and performance with latency, percentiles, and throughput. As the system grows in data volume, traffic, or complexity there should be ways to dealing with that growth.</li>
    <li>Maintainability - Operability and evolvability. Over time, other people will work on the system.</li>
</ul>

Many of the application we see today revolve around the web, and therefore are heavy on user/app generated data. Many applications today need to: (1) Store data using <bold>databases</bold>, (2) Remember the result of an expensive operation using <b>caches<b>, (3) Allow users to search data by keyword or filter it in various ways <b>search indexing</b>, (4) Handle a large amount of accuulated data periodically <b>batch processing</b>. Whenever we combine several tools in order to provide a service our API typically hides that implementation and guarantee that certain things about the data system. When designing a data system or service theres some questions that would arise: 
<ul>
    <li>How do you ensure that the data reamins correct and complete even when things internally go wrong?</li>
    <li>How to consistently provide good performance to clients even when parts of the system is degraded?</li>
    <li>How do you scale to handle an increase in load?</li>
    <li>What does a good API for the service look like?</li>
</ul>

# Reliability
We have a good idea of what reliability means in software. However for the things that go wrong (called faults), systems that anticipate faults and can handle them are referred to as <b>fault tolerant</b> (or resilient). Fault is NOT the same as failure. Its defined as one component of the system deviating from its spc, whereas failre is when the system as whole stops providing the required service to the user. We can never reduce the probability of a fault to 0 and therefore we want to design fault-tolerance machanisms to prevent faults into becoming failures.


## Hardware Faults
This can be hard disk crashes, faulty RAM, power grid blackout, someone unplugs the wrong network cable. Hard disks have a <b>Mean Time To Failure (MTTF)</b> of about 10-50 years where if we have a storage with 10k disks, we can expect 1 disk to die per day. To reduce the failure rate of the system we add redundancy, in this case the disks may be set up in RAID confguration, server will have dual power supplies, and hot swappable CPU's. Data centers may also have batteries and diesel generators for backup power. If one component dies, the redundant component takes its place. This is a method where <b>high availability</b> is absolutely essential. In some cloud platforms such as AWS its common for a virtual machine instance to go dark without warning; these platforms are designed to prioritize flexibility and elasticity over single machine reliability. It is optimal to have a system that can tolerate the loss of entire machines by using fault-tolerance techniques. 

## Software Errors
This can be a bug in the code that causes every instance of an application server to crash when given a particular bad input; a runaway process that uses up some shared resource - CPU time, memory, disk space, or network bandwidth; A service the system depends on that slows down, becomes unresponsive, or starts returning corrupted responses; cascading failures, where a small fault in one component triggers a fault in another component. sometimes we never see these bugs until a special circumstance happens where the software is making an assumption about its environment. 

## Human Errors
We design and build these software systems. We can make our systems reliable by:
<ul>
    <li>Design system where we minimize opprotunities for error. Make it really easy to do the right thing.</li>
    <li>Decouple places where people make the most mistakes. Create sandbox environments where people and experiment using real data without affecting real users. </li>
    <li>Test your code and system at all levels.</li>
    <li>Allow for easy recovery from human errors. We can make it fast to roll back configuration changes. We can roll out code gradually. Provide tools to recompute data.</li>
    <li>Monitor our performance to show early warning signs so we can check wether any assumptions or constrants are being violated. When a problem occurs, metrics can be invaluable when trying to find the root cause. </li>
</ul>

# Scalability
A system working today does not mean it will always work in the future. A common reason is increased load. One day our system that handles 10k concurrent users will have 100k concurrent users and is now processing much more data than it did before. The idea of scalability describes a system's ability to handle an increased load. We have to consider things like: If the system grows in a certain way, what are our options for coping with the growth? How can we add computing resources to handle the additional load?

## Increased Load
Load can be described with a few numbers which we call <b>load parameters</b>. Parameters will depend on the architecture of the system which can be:
<ul>
    <li>Requests per second to a web server</li>
    <li>The ratio of reads to writes in a database</li>
    <li>The number of simultaneously active users in a chat room</li>
    <li>The hit rate on cache</li>
    <li>etc</li>
</ul>

Lets take twitter for example; posting a tweet had 4.6k requests/sec on average and 12k requests/sec at peak. Handling 12k writes to a database would be fine but theres a challange in scaling that up where we can run into a <b>fan out</b> since each user follows many people and each user is follows by many people. Fan out describes the number of logic gate inputs that are attached to another gate's output. The output needs to supply enough current to drive all the attached inputs. We use it to describe the number of requests to other services that we need to make in order to serve one incoming request. <br>

Back to the twitter example, posting a tweet implies we insert the new tweet into a global collection of tweets. When the user requests their home timeline, the DB looks up all the people they follow, find all tweets for each of those users and merge them sorted by time. The SQL statement may look like this:

```
SELECT tweets.*, users.* FROM tweets
JOIN users ON tweets.sender_id = users.id 
JOIN follows ON follows.followee_id = users.id 
WHERE follows.follower_id = current_user
```

Another way we could do this is if we maintain a cache of each user home timeline. When a user posts a tweet, look up all the peple who follow that user, and insert the new tweet into each of their home timeline caches. The request to read the home timeline is then cheap bc its result has been computed ahead of time. 

## Describing Performance
