#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include "std_msgs/String.h"

#include <math.h>

class SubscribeAndPublish
{
public:
	SubscribeAndPublish()
	{
		// Topic you want to publish
		pub_ = n_.advertise<std_msgs::Float64>("/end/command", 1000);

		// Topic you want to subscribe
		sub_ = n_.subscribe("chatter", 1, &SubscribeAndPublish::chatterCallback, this);
	}

	void chatterCallback(const std_msgs::String::ConstPtr &msg)
	{
		int num = std::stoi(msg->data.c_str());
		if (num > prevNum)
		{
			std_msgs::Float64 msg_to_send;
			int angle = 1;
			if (turnLeft)
			{
				angle = -angle;
			}
			msg_to_send.data = angle;
			pub_.publish(msg_to_send);
			ROS_INFO("ismoving goalpos to zero");
			turnLeft = !turnLeft;
		}
		prevNum = num;
	}

private:
	ros::NodeHandle n_;
	ros::Publisher pub_;
	ros::Subscriber sub_;

	bool turnLeft = true;
	int prevNum = -1;
};

int main(int argc, char **argv)
{
	// Initiate ROS
	ros::init(argc, argv, "listener_rotater");

	// Create an object of class SubscribeAndPublish that will take care of everything
	SubscribeAndPublish SAPObject;

	ros::spin();

	return 0;
}
