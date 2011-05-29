package noiseandheat.test
{
    import org.flexunit.Assert;

    public class SimpleTest
    {
        [Test]
        public function testMe():void
        {
            Assert.assertTrue("Was not true", true);
        }

        [Test]
        public function testMeToo():void
        {
            Assert.assertTrue("Was not true", true);
        }

        [Test]
        public function testMeThree():void
        {
            Assert.assertTrue("Was not true", false);
        }

        [Test]
        public function testMeFour():void
        {
            Assert.assertTrue("Was not true", true);
        }

        [Test]
        public function testMeFive():void
        {
            Assert.assertTrue("Was not true", true);
        }
    }
}
