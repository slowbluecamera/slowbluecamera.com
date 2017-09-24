
S3BUCKETNAME=slowbluecamera.com
AWSPROFILE=slowbluecamera

server:
	hugo server -D

update-themes:
	git submodule init
	git submodule update

clean:
	rm -rf public

public:
	-hugo

publish: clean public
	aws --profile ${AWSPROFILE} s3 sync public s3://${S3BUCKETNAME}

s3setup:
	aws --profile ${AWSPROFILE} s3 mb s3://${S3BUCKETNAME}

