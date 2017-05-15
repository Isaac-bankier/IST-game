package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.display.BitmapData;
import nme.display.Bitmap;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_9_9_CustomMouseCursor extends SceneScript
{          	
	
public var _CustomCursor:ActorType;

public var _XOffset:Float;

public var _YOffset:Float;

public var _CursorActor:Actor;

public var _CursorMode:String;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Custom Cursor", "_CustomCursor");
nameMap.set("X-Offset", "_XOffset");
_XOffset = 0.0;
nameMap.set("Y-Offset", "_YOffset");
_YOffset = 0.0;
nameMap.set("Cursor Actor", "_CursorActor");
nameMap.set("Cursor Mode", "_CursorMode");
_CursorMode = "";

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        if(!(#if mobile true #else false #end))
{
            if((_CursorMode == "Default"))
{
                showCursor();
}

            else
{
                hideCursor();
}

            if((_CursorMode == "Custom"))
{
                createRecycledActor(_CustomCursor, 0, 0, Script.FRONT);
                _CursorActor = getLastCreatedActor();
propertyChanged("_CursorActor", _CursorActor);
                getLastCreatedActor().disableActorDrawing();
}

}

    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((!(#if mobile true #else false #end) && ((_CursorMode == "Custom") && _CursorActor.isAlive())))
{
            g.translate((getMouseX() + _XOffset), (getMouseY() + _YOffset));
            _CursorActor.drawImage(g);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}