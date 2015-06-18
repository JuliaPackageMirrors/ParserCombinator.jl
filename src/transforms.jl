
abstract Transform<:Delegate

always_print(::Transform) = false

# transform a result (including failure)
# note that the function will receive a Result instance (Failure, Empty or
# Value) and that the value returned must also be a Result

@auto_hash_equals type TransResult<:Transform
    name::Symbol
    matcher::Matcher
    f::Function
    TransResult(matcher, f) = new(:TransResult, matcher, f)
end

@auto_hash_equals immutable TransState<:DelegateState
    state::State
end

# execute comes from DelegateMatcher

# success and failure both needed (instead of single result) to remove 
# ambiguity from default short-circuit action

# TODO - does this even make sense?  wouldn't we need to modify state too?

response(k::Config, m::TransResult, s, t, i, r::Failure) = Response(TransState(t), i, m.f(r))

response(k::Config, m::TransResult, s, t, i, r::Success) = Response(TransState(t), i, m.f(r))



# transform successes (Empty and Value)
# again, function must return a Result instance

@auto_hash_equals type TransSuccess<:Transform
    name::Symbol
    matcher::Matcher
    f::Function
    TransSuccess(matcher, f) = new(:TransSuccess, matcher, f)
end

# execute comes from Delegate

response(k::Config, m::TransSuccess, s, t, i, r::Success) = Response(TransState(t), i, m.f(r))



# simplified version for transforming Success (remove and re-add the Success
# wrapper).

App(m::Matcher, f::Union(Function,DataType)) = TransSuccess(m, x -> Success(Any[f(x.value...)]))
Appl(m::Matcher, f::Union(Function,DataType)) = TransSuccess(m, x -> Success(Any[f(x.value)]))
