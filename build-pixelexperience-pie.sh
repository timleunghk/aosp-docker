
if [ "$1" = "docker" ]; then
    TEST_BRANCH=${TEST_BRANCH:-ten-plus}
    TEST_URL=${TEST_URL:-https://github.com/PixelExperience/manifest}
    repo init --depth 1 -u "$TEST_URL" -b "$TEST_BRANCH"
    repo sync
    . build/envsetup.sh
    breakfast bullhead
    brunch bullhead
else
    args="bash run.sh docker" 
    export AOSP_EXTRA_ARGS="-v $(cd $(dirname $0) && pwd -P)/$(basename $0):/usr/local/bin/run.sh:ro"
    export AOSP_IMAGE="timleung/aosp:10.0-ten"
   ./aosp $args

    
fi
