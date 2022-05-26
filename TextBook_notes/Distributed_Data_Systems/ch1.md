# Foundations of Data Systems
The 3 big ideas behind this book revolve around:
<ul>
    <li>Reliability - References to hardware/software faults and human error. The system should continue to work correctly even in the face of adversity</li>
    <li>Scalability - Measurng load and performance with latency, percentiles, and throughput. As the system grows in data volume, traffic, or complexity there should be ways to dealing with that growth.</li>
    <li>Maintainability - Operability and evolvability. Over time, other people will work on the system.</li>
</ul>

Many of the application we see today revolve around the web, and therefore are heavy on user/app generated data. Many applications today need to: (1) Store data using <bold>databases</bold>, (2) Remember the result of an expensive operation using <b>caches</b>, (3) Allow users to search data by keyword or filter it in various ways <b>search indexing</b>, (4) Handle a large amount of accuulated data periodically <b>batch processing</b>. Whenever we combine several tools in order to provide a service our API typically hides that implementation and guarantee that certain things about the data system. When designing a data system or service theres some questions that would arise: 
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
Once we have descripbed the upperbound of data (load) on our system there will be some things that will happen once that load increases. There 2 ways of looking at it:
<ul>
    <li>When you increase a load parameter and keep the system resources such as: CPU, memory, network bandwidth, etc) unchanged, how is the performance going to be affected?</li>
    <li>When you increase a load parameter, how much do you need to increase the resources if you want to keep performance unchanged?</li>
</ul>
These questions imply that we need performance metrics. Were going to take a look into describing performance on a system.<br>

### Hadoop batch processing system
In this batch processing system we typically care about throughput, which is the number of records we can process per second or the total time it takes tp run  a job on a dataset of a certain size. When it comes to web systems we really care about **response time** which is the time between a clinet sending a request and receiving a response.<br>

As a side note, latency and response time are usually seen as hvaing the same meaning but theyre not the same. 
<ul>
    <li>**Response time** is what the client sees (besides the actual time to process the request i.e service time. It inlcudes network delays and queueing delays.</li>
    <li>**Latency** is the duration that a request is waiting to be handled (during which it is latent, awaitng service.</li>
</ul>

Making the same request repeatedly will grant you a slightly different response time every time. Therefore we have to think of response time as a distribution of values that you can measure. There can be many causes to having a different and even slower response time (random additional latency) such as:
<ul>
    <li>Loss of a network packet</li>
    <li>Garbage collection pause</li>
    <li>Context switch to a background process</li>
    <li>A page fault forcing a read from a disk</li>
    <li>Physical viabration in server rack</li>
    <li>etc</li>
</ul>

However we can be given an average response time, but it isnt a good metric since we want to convey typical response time. We want to know how many users expereinced a delay. We can express this using percentiles. This way, we can figure out how bad our outliers are in the 95-99th percentile. High percentiles of response time are known as **tail latencies**. these directly affect the users experience of the service. <br>

For example Amazon has response time requirements for the 99.9th percentile. They have found that customers with the slowest requests have the most data on their accounts because they have many many purchases and therefore the most valuebale customers. Its really important to keep them happy by ensuring a very fast and reliable website to browse through. They have also seen that a 100ms increase in response time reduces sales by 1% and satisfaction also goes down as well. <br>

Queueing delays also account for a large part of the response time at high percentiles. A server can only process a small number of things in parallel (limited by its number of CPU cores). It only takes a small number of slow requests to hold up the processing of subsequent requests - this effect is known as <b>head-of-line blocking</b><br>

High percentiles become really important in backend services that are called multiple times as part of serving a single end user request. Even if you make the calls in parallel, the end user requests still need to wait for the slowest parallel calls to complete. If only a small percentage of backend calls are slow, the chance of getting a slow call increases if an end user request requires multiple backend calls, and so a higher proportion of end user requests end up being slow (an effect called tail latency amplification)


## Coping With Load
How do we maintain good performance even when our load parameters increase by some amount? Think about horizontal and vertical scaling a system. Some systems are <b>elastic</b> meaning they can automatically add computing resources when they detect a load increase, whereas some system are scaled manually. 
<ul>
    <li>A stateless application is a program that does not save client data generated in one session for use with the next session with that client. </li>
    <li>A stateful application saves user data for newer sessions.</li>
</ul>

Therefore a stateful data system is introduce complexity when turning it into a distributed system. For this reason we always keep our database on a single node and scale upwards until scaling cost or high availability required force us to make it a distributed system. An architecture that scales well for a particular application is built around the assumption of which operations will be common and which will be rare - the load parameters. 

## Maintainability
The majority of the cost of software is its maintenance such as fixing bugs, keeping systems operational, investigating failures, adapting to new platforms, modifying it fo new use cases. There 3 design principles for software system to tackle this idea of maintainability

### Operability
Making it easy for operations teams to keep the system running smoothly.<br>


### Simplicity
Making it easy for new engineers to understand the system by abstracting complexity. 

### Evolvability
Making it easy for engineers to make changes to the system in the future and adapting to for unanticipated use cases as requirements change. 


