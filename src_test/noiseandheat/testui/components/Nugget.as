package noiseandheat.testui.components
{
    import flash.display.LineScaleMode;
    import org.flexunit.runner.IDescription;
    import flash.display.Sprite;

    /**
     * Copyright (c) 2011 HuzuTech
     */
    public class Nugget
        extends Sprite
    {
        protected static const X:int =  2;
        protected static const Y:int =  2;
        protected static const W:int = 12;
        protected static const H:int = 12;

        public static const STATE_UNCERTAIN           :int = 0;
        public static const STATE_IGNORED             :int = 1;
        public static const STATE_STARTED             :int = 2;
        public static const STATE_FINISHED_SUCCESS    :int = 3;
        public static const STATE_FINISHED_FAILURE    :int = 4;
        public static const STATE_RUN_STARTED         :int = 5;
        public static const STATE_RUN_FINISHED_SUCCESS:int = 6;
        public static const STATE_RUN_FINISHED_FAILURE:int = 7;
        public static const STATE_FAILURE             :int = 8;
        public static const STATE_ASSUMPTION_FAILURE  :int = 9;
        public static const STATE_SUITE               :int = 10;
        public static const STATE_FINISHED            :int = 10;

        protected var description:IDescription;
        protected var _state:int;
        protected var _message:String;
        protected var _stackTrace:String;

        public function Nugget(description:IDescription)
        {
            mouseChildren = false;
            this._state = STATE_UNCERTAIN;
            this.description = description;
            _message = "";
            _stackTrace = "";
            drawBase();
            update();
        }

        public function set state(value:int):void
        {
            if(value != _state)
            {
                _state = value;
                update();
            }
        }

        public function get state():int
        {
            return _state;
        }

        protected function drawBase():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xffffff, 1.0);
            graphics.drawRect(X-2, Y-2, W+4, H+4);
            graphics.endFill();

            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(X-1, Y-1, W+2, H+2);
            graphics.endFill();
        }

        protected function drawUncertain():void
        {
            graphics.lineStyle(1, 0xcccccc, 1, true, LineScaleMode.NONE);

            graphics.drawRect(X + 3, Y + 3, W - 7, H - 7);
        }

        protected function drawIgnored():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xcccccc, 0.25);
            graphics.drawRect(X, Y, W, H);
            graphics.endFill();
        }

        protected function drawStarted():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0x00ff00, 1.0);
            graphics.drawEllipse(X, Y, W, H);
            graphics.endFill();
        }

        protected function drawFinishedSuccess():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0x00ff00, 1.0);
            graphics.drawEllipse(X, Y, W, H);
            graphics.endFill();
        }

        protected function drawFinishedFailure():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xff0000, 1.0);
            graphics.drawEllipse(X, Y, W, H);
            graphics.endFill();
        }

        protected function drawRunStarted():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xffcc00, 1.0);
            graphics.drawRect(X + W/2, Y, W/2, H);
            graphics.endFill();
        }

        protected function drawRunFinishedSuccess():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0x00ff00, 1.0);
            graphics.drawRect(X, Y, W/2, H);
            graphics.endFill();

            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(X+W/2, Y, W/2, H);
            graphics.endFill();
        }

        protected function drawRunFinishedFailure():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xff0000, 1.0);
            graphics.drawRect(X, Y, W/2, H);
            graphics.endFill();

            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(X+W/2, Y, W/2, H);
            graphics.endFill();
        }

        protected function drawFailure():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xff0000, 1.0);
            graphics.drawEllipse(X, Y, W, H);
            graphics.endFill();
        }

        protected function drawAssumptionFailure():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xff0000, 1.0);
            graphics.drawRect(X, Y, W, H);
            graphics.endFill();
        }

        protected function drawSuite():void
        {
        }

        protected function drawFinished():void
        {
            graphics.lineStyle(1, 0x000000, 0, true, LineScaleMode.NONE);

            graphics.beginFill(0xffffff, 1.0);
            graphics.drawRect(X, Y, W, H);
            graphics.endFill();
        }

        public function update():void
        {
            switch(_state)
            {
            case STATE_IGNORED:
                drawIgnored();
                break;
            case STATE_STARTED:
                drawStarted();
                break;
            case STATE_FINISHED_SUCCESS:
                drawFinishedSuccess();
                break;
            case STATE_FINISHED_FAILURE:
                drawFinishedFailure();
                break;
            case STATE_RUN_STARTED:
                drawRunStarted();
                break;
            case STATE_RUN_FINISHED_SUCCESS:
                drawRunFinishedSuccess();
                break;
            case STATE_RUN_FINISHED_FAILURE:
                drawRunFinishedFailure();
                break;
            case STATE_FAILURE:
                drawFailure();
                break;
            case STATE_ASSUMPTION_FAILURE:
                drawAssumptionFailure();
                break;
            case STATE_SUITE:
                drawSuite();
                break;
            case STATE_FINISHED:
                drawFinished();
                break;
            case STATE_UNCERTAIN:
            default:
                drawUncertain();
                break;
            }
        }

        public function get message():String
        {
            return _message;
        }

        public function set message(message:String):void
        {
            _message = message || "";
        }

        public function get stackTrace():String
        {
            return _stackTrace;
        }

        public function set stackTrace(stackTrace:String):void
        {
            _stackTrace = stackTrace || "";
        }

        override public function toString():String
        {
            var message:String = "[no details]";

            if(description) message = description.displayName;

            return message + (_message ? ": " + _message : "");
        }

        public function toFullString():String
        {
            var message:String = "[no details]";

            if(description)
            {
                message = description.displayName;
                message += "\n";
            }

            if(_stackTrace)
            {
                message += (_stackTrace ? ": " + _stackTrace : "");
                message += "\n";
            }
            else
            {
                message += (_message ? ": " + _message : "");
                message += "\n";
            }

            return message;
        }
    }
}
