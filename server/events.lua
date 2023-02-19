Events = {};

function Events:Create(name, cb)
    if self[name] then return end

    self[name] = cb

    RegisterNetEvent(name)

    return AddEventHandler(name, function(...)
        cb(...)
    end)
end

function Events:Trigger(name, ...)
    if not self[name] then return end

    TriggerEvent(name, ...)
end

function Events:Remove(name)
    if not self[name] then return end

    self[name] = nil

    return RemoveEventHandler(name)
end

function Events:TriggerClient(name, source, ...)
    if not self[name] then return end

    TriggerClientEvent(name, source, ...)
end

-- exports
exports('Create', function(name, cb)
    return Events:Create(name, cb)
end)

exports('Trigger', function(name, ...)
    return Events:Trigger(name, ...)
end)

exports('TriggerClient', function(name, source, ...)
    return Events:TriggerClient(name, source, ...)
end)

exports('Remove', function(name)
    return Events:Remove(name)
end)

exports('GetEvents', function()
    return Events
end)