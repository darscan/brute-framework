/*
 * Copyright (c) 2009, 2010 lolvision
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	/**
	 * The Brute Framework (A Wrecking Ball)
	 *
	 * If you're going to screw around with statics you may as well go all the way!
	 *
	 * @author lolvision
	 */
	public dynamic class Brute extends Sprite
	{
		protected static const instances:Dictionary = new Dictionary();
		
		public static function get(key:Object = ''):Brute
		{
			return instances[key] ||= new Brute();
		}
		
		public static function has(key:Object = ''):Boolean
		{
			return instances[key];
		}
		
		public static function destroy(key:Object = ''):void
		{
			delete instances[key];
		}
		
		protected static function destroyInstance(brute:Brute):void
		{
			for (var key:Object in instances)
				if (instances[key] == brute)
					destroy(key);
		}
		
		public function destroy():void
		{
			destroyInstance(this);
		}
	}
}