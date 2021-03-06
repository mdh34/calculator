/* Copyright 2014 Marvin Beckers <beckersmarvin@gmail.com>
*
* This file is part of Pantheon Calculator
*
* Pantheon Calculator is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Pantheon Calculator is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Pantheon Calculator. If not, see http://www.gnu.org/licenses/.
*/

namespace PantheonCalculator.Core {
    public errordomain STACK_ERROR {
        EMPTY
    }
    public class Stack<TYPE> : Object {
        private TYPE?[] stack_array;

        public Stack () { }

        public void push (TYPE t) {
            stack_array.resize (stack_array.length + 1);
            stack_array[stack_array.length - 1] = t;
        }

        public TYPE? pop () {
            if (!this.empty ()) {
                TYPE output = stack_array[stack_array.length - 1];
                stack_array[stack_array.length - 1] = 0;
                stack_array.resize (stack_array.length - 1);
                return output;
            } else {
                return null;
                //throw new STACK_ERROR.EMPTY (_("Stack is empty."));
            }
        }

        public TYPE? peek () {
            return stack_array[stack_array.length - 1];
        }

        public bool empty () {
            return this.is_length (0);
        }

        public bool is_length (int in_length) {
            return (in_length == stack_array.length);
        }

        public int get_length () {
            return stack_array.length;
        }
    }
}
