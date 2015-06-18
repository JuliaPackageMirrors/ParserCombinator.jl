
module ParserCombinator

using Compat
using AutoHashEquals
import Base: start, endof, getindex

export @with_names, set_name,
Config, Cache, NoCache, make, make_all, make_one, parse_one, parse_all,
Debug, Trace, parse_dbg,
Matcher, State, Result, Success, Execute, Response, 
Failure, EMPTY, FAILURE, Clean, CLEAN, Dirty, DIRTY,
ParserException, Value, Empty, EMPTY, Delegate, DelegateState,
Epsilon, Insert, Dot, Fail, Drop, Equal, Repeat, Depth, Breadth, ALL, 
Series, Seq, And, Alt, Lookahead, Not, Pattern, Delayed, Eos,
TransResult, TransSuccess, TransValue, App, Appl, array,
@p_str, @P_str, @s_str, @S_str, Opt,
Parse, PUInt, PUInt8, PUInt16, PUInt32, PUInt64, 
PInt, PInt8, PInt16, PInt32, PInt64, PFloat32, PFloat64,
Word, Space, Star, Plus,
@with_pre, @with_post, set_fix

include("types.jl")
include("names.jl")
include("matchers.jl")
include("parsers.jl")
include("debug.jl")
include("transforms.jl")
include("sugar.jl")
include("extras.jl")
include("print.jl")
include("fix.jl")

end
