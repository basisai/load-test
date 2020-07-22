version = "1.0"

train {
    step wrk2 {
        image = "bootjp/wrk2"
        script = [
            {sh = [
                "wrk -U -t $THREAD -c $CONNECTIONS -R $THROUGHPUT -d $RUN_TIME -s post.lua $ENDPOINT_URL || true"
            ]}
        ]

        resources {
            cpu = "500m"
            memory = "100M"
        }
    }

    parameters {
        ENDPOINT_URL = "https://"
        THREAD = "4"
        CONNECTIONS = "8"
        THROUGHPUT = "20"
        RUN_TIME = "5m"
    }
}
