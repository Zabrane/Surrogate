%%% -------------------------------------------------------------------
%%% Author  : skruger
%%% Description :
%%%
%%% Created : Oct 30, 2010
%%% -------------------------------------------------------------------
-module(surrogate_sup).

-behaviour(supervisor).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% External exports
%% --------------------------------------------------------------------
-export([start_link/1]).

%% --------------------------------------------------------------------
%% Internal exports
%% --------------------------------------------------------------------
-export([
	 init/1
        ]).

%% --------------------------------------------------------------------
%% Macros
%% --------------------------------------------------------------------
-define(SERVER, ?MODULE).

%% --------------------------------------------------------------------
%% Records
%% --------------------------------------------------------------------

%% ====================================================================
%% External functions
%% ====================================================================

start_link(Args) ->
	supervisor:start_link({local,?MODULE},?MODULE,Args).


%% ====================================================================
%% Server functions
%% ====================================================================
%% --------------------------------------------------------------------
%% Func: init/1
%% Returns: {ok,  {SupFlags,  [ChildSpec]}} |
%%          ignore                          |
%%          {error, Reason}
%% --------------------------------------------------------------------
init([]) ->
	{ok,{{one_for_one,5,1},
		 [{surrogate_log,
		   {surrogate_log,start_link,[]}, %%"Surrogate/surrogate.log","Surrogate/access.log"
		   permanent,
		   10000,
		   worker,
		   []},
		  {proxyconf,
		   {proxyconf,start_link,[]}, %% "Surrogate/conf/proxy.conf"
		   permanent,
		   10000,
		   worker,
		   []},
		  {listener_sup,
		   {listener_sup,start_link,[]},
		   permanent,
		   10000,
		   supervisor,
		   []}
		  
		 ]}}.

%% ====================================================================
%% Internal functions
%% ====================================================================

